class RoomDiagramController < ApplicationController
  def index
    @floors = [1,2,3]
    @rooms = Room.all
  end

end
