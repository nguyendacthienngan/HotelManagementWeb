# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
  clients = Client.create([
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
