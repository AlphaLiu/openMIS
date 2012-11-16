#encoding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
User.delete_all

admin_role = Role.create(name: "admin", display_name: "系统管理员")
purchase_role = Role.create(name: "purchase", display_name: "采购员")
sales_role = Role.create(name: "sales", display_name: "业务员")
store_role = Role.create(name: "store", display_name: "仓库管理员")

user = admin_role.users.build(name: "admin", email: "admin@example.com", password: "123456", password_confirmation: "123456")
user.save
user.create_userinfo(real_name: "刘XX", gender: "男", id_num: "20100304001", office_phone: "(020) 89898989-20941", home_phone: "(020)9989909", cellphone: "1238778878", join_date: "2012-04-04")

user = purchase_role.users.build(name: "james", email: "james@example.com", password: "123456", password_confirmation: "123456")
user.save
user.create_userinfo(real_name: "马XX", gender: "男", id_num: "20100308008", office_phone: "(020) 88457989-20942", home_phone: "(020)7789809", cellphone: "123877889", join_date: "2012-08-04")

user = sales_role.users.build(name: "jimmy", email: "jimmy@example.com", password: "123456", password_confirmation: "123456")
user.save
user.create_userinfo(real_name: "黄XX", gender: "男", id_num: "20100304002", office_phone: "(020) 89998889-20943", home_phone: "(020)8888888", cellphone: "1238799999", join_date: "2011-07-04")

user = store_role.users.build(name: "johny", email: "johny@example.com", password: "123456", password_confirmation: "123456")
user.save
user.create_userinfo(real_name: "罗XX", gender: "女", id_num: "20100366666", office_phone: "(020) 89899989-20948", home_phone: "(020)5555555", cellphone: "1277778878", join_date: "2010-08-07")


