# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

clients = Client.create([
                            {
                              name: "Khách lữ hành",
                              citizen_id: '012345678',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,11,11,0),
                              email: 'khachluhanh@gmail.com',
                              client_type: '0',
                              phone_number: '0123456789'
                            },
                            { name: 'Nguyễn Lê Bách' ,
                              citizen_id: '0123456789',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,11,11,0),
                              email: 'nlebachnlb@gmail.com',
                              client_type: '0',
                              phone_number: '0123456789'
                            },
                            { name: 'Tăng Khánh Chương',
                              citizen_id: '0123456788',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,4,21,0),
                              email: 'tangkhanhchuong@gmail.com',
                              client_type: '0',
                              phone_number: '0123456788'
                            },
                            { name: 'Đỗ Ngọc Cường',
                              citizen_id: '0123456787',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,4,10,0),
                              email: 'dongoccuong@gmail.com',
                              client_type: '0',
                              phone_number: '0123456787'
                            },
                          ])

employees = Employee.create([
                                {
                                  name: 'Nguyễn Đắc Thiên Ngân',
                                  citizen_id: '0123456786',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(2000,5,15,0),
                                  email: 'nguyendacthienngan@gmail.com',
                                  employee_type: '0',
                                  phone_number: '0123456786',
                                  status: 0
                                },
                                {
                                  name: 'Ung Bao Tien',
                                  citizen_id: '0123456785',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1999,12,25,0),
                                  email: 'ungbaotien@gmail.com',
                                  employee_type: '0',
                                  phone_number: '0123456785',
                                  status: 0
                                },
                                {
                                  name: 'Nguyễn Thị Quỳnh Ngân',
                                  citizen_id: '0123456784',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(2000,9,25,0),
                                  email: 'nguyenthiquynhngan@gmail.com',
                                  employee_type: '0',
                                  phone_number: '0123456784',
                                  status: 0
                                },
                              ])

user = User.create! :email => 'admin@gmail.com', :password => '123456', :password_confirmation => '123456', :employee_id => 1

services = Service.create([
                            { name: 'Cháo',
                              unit_price: '24000',
                              status: 0
                            },
                            { name: 'Cơm',
                              unit_price: '20000',
                              status: 0
                            },
                            { name: 'Phở',
                              unit_price: '30000',
                              status: 0
                            }
                          ])


roomTypes = RoomType.create!([
                              {
                                name: "Standard",
                                description: "Phòng tiêu chuẩn trong khách sạn với trang bị tối thiểu, tầng thấp, không có view đẹp",
                                beds: 1,
                                available_rooms: 4
                              },
                              {
                                name: "Superior Twin",
                                description: "Chất lượng cao hơn Standard, diện tích lớn hơn, trang bị nhiều thiết bị tiện nghi, view đẹp",
                                beds: 2,
                                available_rooms: 6
                              },
                              {
                                name: "Superior Double",
                                description: "Chất lượng cao hơn Standard, diện tích lớn hơn, trang bị nhiều thiết bị tiện nghi, view đẹp",
                                beds: 1,
                                available_rooms: 10
                              },
                              {
                                name: "Deluxe Twin",
                                description: "Thường ở trên tầng cao với chất lượng tốt hơn Superior. Diện tích rộng, tầm nhìn đẹp với trang thiết bị cao cấp",
                                beds: 2,
                                available_rooms: 9
                              },
                              {
                                name: "Deluxe Double",
                                description: "Thường ở trên tầng cao với chất lượng tốt hơn Superior. Diện tích rộng, tầm nhìn đẹp với trang thiết bị cao cấp",
                                beds: 1,
                                available_rooms: 15
                              },
                              {
                                name: "Suite Double",
                                description: "Loại phòng cao cấp nhất trong khác sạn. Thường thì phòng khách và phòng ngủ riêng biệt, có ban công, view đẹp nhất. Tương tự phòng Tổng Thống, Hoàng Gia",
                                beds: 1,
                                available_rooms: 15
                              }
                            ])

prices = RoomPrice.create!([
                             ####### Standard Room #######
                             {
                               #Standard Room (Giá theo giờ -> PriceType: 1)
                               room_type_id: 1,
                               price: 40000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá theo ngày -> PriceType: 2)
                               room_type_id: 1,
                               price: 550000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá theo tuần -> PriceType: 3)
                               room_type_id: 1,
                               price: 540000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá theo tháng -> PriceType: 4)
                               room_type_id: 1,
                               price: 530000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá theo năm -> PriceType: 5)
                               room_type_id: 1,
                               price: 520000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 1,
                               price: 40000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Standard Room (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 1,
                               price: 30000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             ####### Superior Twin  #######
                             {
                               #Superior Twin (Giá theo giờ -> PriceType: 1)
                               room_type_id: 2,
                               price: 50000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá theo ngày -> PriceType: 2)
                               room_type_id: 2,
                               price: 600000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá theo tuần -> PriceType: 3)
                               room_type_id: 2,
                               price: 580000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá theo tháng -> PriceType: 4)
                               room_type_id: 2,
                               price: 570000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá theo năm -> PriceType: 5)
                               room_type_id: 2,
                               price: 560000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 2,
                               price: 50000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Twin (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 2,
                               price: 40000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             ####### Superior Double  #######
                             {
                               #Superior Double (Giá theo giờ -> PriceType: 1)
                               room_type_id: 3,
                               price: 50000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá theo ngày -> PriceType: 2)
                               room_type_id: 3,
                               price: 600000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá theo tuần -> PriceType: 3)
                               room_type_id: 3,
                               price: 580000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá theo tháng -> PriceType: 4)
                               room_type_id: 3,
                               price: 570000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá theo năm -> PriceType: 5)
                               room_type_id: 3,
                               price: 560000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 3,
                               price: 50000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Superior Double (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 3,
                               price: 40000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             ####### Deluxe Twin  #######
                             {
                               #Deluxe Twin (Giá theo giờ -> PriceType: 1)
                               room_type_id: 4,
                               price: 70000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá theo ngày -> PriceType: 2)
                               room_type_id: 4,
                               price: 750000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá theo tuần -> PriceType: 3)
                               room_type_id: 4,
                               price: 740000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá theo tháng -> PriceType: 4)
                               room_type_id: 4,
                               price: 730000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá theo năm -> PriceType: 5)
                               room_type_id: 4,
                               price: 720000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 4,
                               price: 70000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Twin (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 4,
                               price: 60000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             ####### Deluxe Double  #######
                             {
                               #Deluxe Double (Giá theo giờ -> PriceType: 1)
                               room_type_id: 5,
                               price: 70000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá theo ngày -> PriceType: 2)
                               room_type_id: 5,
                               price: 750000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá theo tuần -> PriceType: 3)
                               room_type_id: 5,
                               price: 740000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá theo tháng -> PriceType: 4)
                               room_type_id: 5,
                               price: 730000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá theo năm -> PriceType: 5)
                               room_type_id: 5,
                               price: 720000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 5,
                               price: 70000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Deluxe Double (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 5,
                               price: 60000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             ####### Suite Double  #######
                             {
                               #Suite Double (Giá theo giờ -> PriceType: 1)
                               room_type_id: 6,
                               price: 80000,
                               price_type: 1,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá theo ngày -> PriceType: 2)
                               room_type_id: 6,
                               price: 950000,
                               price_type: 2,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá theo tuần -> PriceType: 3)
                               room_type_id: 6,
                               price: 940000,
                               price_type: 3,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá theo tháng -> PriceType: 4)
                               room_type_id: 6,
                               price: 930000,
                               price_type: 4,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá theo năm -> PriceType: 5)
                               room_type_id: 6,
                               price: 920000,
                               price_type: 5,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá thêm người lớn -> PriceType: 6)
                               room_type_id: 6,
                               price: 80000, #/ngày/người
                               price_type: 6,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                             {
                               #Suite Double (Giá thêm con nít -> PriceType: 7)
                               room_type_id: 6,
                               price: 70000, #/ngày/người
                               price_type: 7,
                               date: DateTime.new(2021,6,3,0),
                               is_available: true
                             },
                           ])

Room.create!([
                      {
                        name: "101",
                        status: 1,
                        floor: 1,
                        description: "Phòng tiêu chuẩn",
                        room_type_id: 1
                      },
                      {
                        name: "102",
                        status: 1,
                        floor: 1,
                        description: "Phòng tiêu chuẩn",
                        room_type_id: 1
                      },
                      {
                        name: "103",
                        status: 1,
                        floor: 1,
                        description: "Phòng tiêu chuẩn",
                        room_type_id: 1
                      },
                      {
                        name: "104",
                        status: 1,
                        floor: 1,
                        description: "Phòng tiêu chuẩn",
                        room_type_id: 1
                      },
                      {
                        name: "105",
                        status: 1,
                        floor: 1,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 2,
                      },
                      {
                        name: "106",
                        status: 1,
                        floor: 1,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 3
                      },
                      {
                        name: "201",
                        status: 1,
                        floor: 2,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 4
                      },
                      {
                        name: "202",
                        status: 1,
                        floor: 2,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 4
                      },
                      {
                        name: "203",
                        status: 1,
                        floor: 2,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 5
                      },
                      {
                        name: "204",
                        status: 1,
                        floor: 2,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 5
                      },
                      {
                        name: "301",
                        status: 1,
                        floor: 3,
                        description: "Phòng sang xịn mịn",
                        room_type_id: 6
                      },
                    ])
