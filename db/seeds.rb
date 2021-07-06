# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

clients = Client.create([
                            {
                              name: "Khách lữ hành",
                              citizen_id: '221489036',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,11,11,0),
                              email: 'khachluhanh@gmail.com',
                              client_type: '0',
                              phone_number: '0984123444'
                            },
                            { name: 'Nguyễn Lê Bách' ,
                              citizen_id: '221467092',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,12,11,0),
                              email: 'nlebachnlb@gmail.com',
                              client_type: '0',
                              phone_number: '0987222489'
                            },
                            { name: 'Tăng Khánh Chương',
                              citizen_id: '221468039',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,4,21,0),
                              email: 'tangkhanhchuong@gmail.com',
                              client_type: '0',
                              phone_number: '0945678092'
                            },
                            { name: 'Đỗ Ngọc Cường',
                              citizen_id: '221478246',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(2000,7,10,0),
                              email: 'dongoccuong@gmail.com',
                              client_type: '0',
                              phone_number: '0169352557'
                            },
                            {
                              name: 'Nguyễn Thị Thúy',
                              citizen_id: '221467334',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,2,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0987666544',
                            },
                            {
                              name: 'Trần Thanh Thanh',
                              citizen_id: '221467334',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,9,19,0),
                              email: 'tranthanhthanh@gmail.com',
                              client_type: '1',
                              phone_number: '0987666577',
                            },
                            {
                              name: 'Võ Bảo Hoa',
                              citizen_id: '221467335',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,3,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0987888657',
                            },
                            {
                              name: 'Nguyễn Văn Tuấn',
                              citizen_id: '221467555',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,2,19,0),
                              email: 'nguyenvantuan@gmail.com',
                              client_type: '1',
                              phone_number: '0924578356',
                            },
                            {
                              name: 'Nguyễn Văn Tuấn',
                              citizen_id: '221467555',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,5,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0924578355',
                            },
                            {
                              name: 'Phạm Duy Hùng',
                              citizen_id: '221467345',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,6,19,0),
                              email: 'phamduyhung@gmail.com',
                              client_type: '1',
                              phone_number: '0987456666',
                            },
                            {
                              name: 'Nguyễn Thị Lệ',
                              citizen_id: '221467334',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,1,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0987666544',
                            },
                            {
                              name: 'Nguyễn Thanh Thanh',
                              citizen_id: '221467334',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,7,19,0),
                              email: 'nguyenthanhthanh@gmail.com',
                              client_type: '1',
                              phone_number: '0987666577',
                            },
                            {
                              name: 'Võ Hồng Hoa',
                              citizen_id: '221467335',
                              gender: 1,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,10,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0987888657',
                            },
                            {
                              name: 'Nguyễn Văn Tân',
                              citizen_id: '221467555',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,8,19,0),
                              email: 'nguyenvantan@gmail.com',
                              client_type: '1',
                              phone_number: '0924578356',
                            },
                            {
                              name: 'Nguyễn Văn Tấn',
                              citizen_id: '221467555',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,3,19,0),
                              email: '',
                              client_type: '0',
                              phone_number: '0924578355',
                            },
                            {
                              name: 'Phạm Duy Tuấn',
                              citizen_id: '221467389',
                              gender: 0,
                              nationality: 'Viet Nam',
                              date_of_birth: DateTime.new(1962,5,19,0),
                              email: 'phamduytuan@gmail.com',
                              client_type: '1',
                              phone_number: '0987456666',
                            },
                            
                          ])

employees = Employee.create([
                                {
                                  name: 'Vũ Khả Âu',
                                  citizen_id: '221489036',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(2000,5,15,0),
                                  email: 'vkAu@gmail.com',
                                  employee_type: '0',
                                  phone_number: '0984123444',
                                  address: '12A Đinh Tiên Hoàng, Quận 1, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Trần Thanh Nhã',
                                  citizen_id: '221467092',
                                  gender: 0,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1999,12,25,0),
                                  email: 'ttNha@gmail.com',
                                  employee_type: '1',
                                  phone_number: '0987222489',
                                  address: '177 Tôn Thất Thuyết, Quận 3, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Nguyễn Ái My',
                                  citizen_id: '221468039',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1999,1,5,0),
                                  email: 'naMy@gmail.com',
                                  employee_type: '1',
                                  phone_number: '0945678092',
                                  address: '177 Tôn Thất Thuyết, Quận 3, TP.Hồ Chí Minh',
                                  status: 1
                                },
                                {
                                  name: 'Trần Ngọc Hân',
                                  citizen_id: '221478246',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1989,3,8,0),
                                  email: 'tnHan@gmail.com',
                                  employee_type: '1',
                                  phone_number: '0169352557',
                                  address: '177 Tôn Thất Thuyết, Quận 3, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Nguyễn Thị Thúy',
                                  citizen_id: '221467334',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '2',
                                  phone_number: '0987666544',
                                  address: '33 Đông Khởi, Quận 6, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Trần Thanh Thanh',
                                  citizen_id: '221467334',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '2',
                                  phone_number: '0987666577',
                                  address: '113 Mai Hắc Đế, Quận 7, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Võ Bảo Hoa',
                                  citizen_id: '221467335',
                                  gender: 1,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '2',
                                  phone_number: '0987888657',
                                  address: '256 Mai Hắc Đế, Quận 7, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Phạm Duy Hùng',
                                  citizen_id: '221467345',
                                  gender: 0,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '3',
                                  phone_number: '0987456666',
                                  address: '123 Trần Nhật Duật, Quận 9, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Nguyễn Văn Tuấn',
                                  citizen_id: '221467555',
                                  gender: 0,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '3',
                                  phone_number: '0924578356',
                                  address: '125 Trần Phú, Quận 9, TP.Hồ Chí Minh',
                                  status: 0
                                },
                                {
                                  name: 'Nguyễn Văn Tuấn',
                                  citizen_id: '221467555',
                                  gender: 0,
                                  nationality: 'Viet Nam',
                                  date_of_birth: DateTime.new(1962,7,19,0),
                                  email: '',
                                  employee_type: '3',
                                  phone_number: '0924578355',
                                  address: '245 Đông Khởi, Quận 10, TP.Hồ Chí Minh',
                                  status: 1
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
                                description: "Phòng tiêu chuẩn trong khách sạn, giường đôi, nước đóng chai miễn phí, máy lạnh, tầng thấp, không có view đẹp",
                                beds: 1,
                                available_rooms: 2
                              },
                              {
                                name: "Superior Twin",
                                description: "Diện tích lớn hơn Standard, giường đơn, nước đóng chai miễn phí, máy lạnh, tủ lạnh, view đẹp",
                                beds: 2,
                                available_rooms: 4
                              },
                              {
                                name: "Superior Double",
                                description: "Diện tích lớn hơn Superior Twin, giường đôi, diện tích lớn hơn, nước đóng chai miễn phí, máy lạnh, tủ lạnh, view đẹp",
                                beds: 2,
                                available_rooms: 4
                              },
                              {
                                name: "Deluxe Twin",
                                description: "Nằm ở trên tầng cao với diện tích lớn hơn Superior. 1 giường đôi & 1 giường đơn, nước đóng chai miễn phí, máy lạnh, tủ lạnh, bồn tắm, view đẹp",
                                beds: 2,
                                available_rooms: 4
                              },
                              {
                                name: "Deluxe Double",
                                description: "Diện tích lớn hơn Superior, giường đôi, nước đóng chai miễn phí, máy lạnh, bếp nhỏ, lò vi sóng, tủ lạnh, view đẹp",
                                beds: 2,
                                available_rooms: 4
                              },
                              {
                                name: "Suite Double",
                                description: "Loại phòng cao cấp nhất trong khác sạn, phòng khách và phòng ngủ riêng biệt, và các tiện nghi ấn tượng, trang trí và các dịch vụ được thiết kế riêng, có ban công, view đẹp nhất.",
                                beds: 3,
                                available_rooms: 6
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
                        description: "Phòng độc lập",
                        room_type_id: 2,
                      },
                      {
                        name: "106",
                        status: 1,
                        floor: 1,
                        description: "Phòng tiện nghi",
                        room_type_id: 3
                      },
                      {
                        name: "201",
                        status: 1,
                        floor: 2,
                        description: "Phòng cao cấp",
                        room_type_id: 4
                      },
                      {
                        name: "202",
                        status: 1,
                        floor: 2,
                        description: "Phòng cao cấp",
                        room_type_id: 4
                      },
                      {
                        name: "203",
                        status: 1,
                        floor: 2,
                        description: "Phòng thượng hạng",
                        room_type_id: 5
                      },
                      {
                        name: "204",
                        status: 1,
                        floor: 2,
                        description: "Phòng thượng hạng",
                        room_type_id: 5
                      },
                      {
                        name: "301",
                        status: 1,
                        floor: 3,
                        description: "Phòng tổng thống",
                        room_type_id: 6
                      },
                    ])
