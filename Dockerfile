# Dockerfile
# Pre setup stuff
FROM ruby:2.7.3 as builder
# Add Yarn to the repository
# Ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    apt-transport-https \
    nodejs \
    postgresql-client \
    yarn

# Install system dependencies & clean them up
# RUN apt-get update -qq && apt-get install -y \
#     postgresql-client build-essential nodejs yarn \
#     libnotify-dev && \
#     rm -rf /var/lib/apt/lists/*
# This is where we build the rails app

FROM builder as rails-app
# Allow access to port 3000
EXPOSE 3000
EXPOSE 3035
# This is to fix an issue on Linux with permissions issues
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG APP_DIR=/home/user/myapp
# Create a non-root user
RUN groupadd --gid $GROUP_ID user
RUN useradd --no-log-init --uid $USER_ID --gid $GROUP_ID user --create-home
# Remove existing running server
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# Permissions crap
RUN mkdir -p $APP_DIR
RUN chown -R $USER_ID:$GROUP_ID $APP_DIR

# Define the user running the container
USER $USER_ID:$GROUP_ID
WORKDIR $APP_DIR
# Install rails related dependencies
COPY --chown=$USER_ID:$GROUP_ID Gemfile* $APP_DIR/
# For webpacker / node_modules
COPY --chown=$USER_ID:$GROUP_ID package.json $APP_DIR
COPY --chown=$USER_ID:$GROUP_ID yarn.lock $APP_DIR

COPY --chown=$USER_ID:$GROUP_ID . .

ENV BUNDLER_VERSION=2.2.18

#RUN gem update --system && \
#    gem install bundler:2.2.18 && \
#    bundle install

RUN bundle install
# Copy over all files
RUN yarn install --check-files

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
