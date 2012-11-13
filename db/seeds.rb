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
Role.create(name: "purchase", display_name: "采购员")
Role.create(name: "sales", display_name: "业务员")
Role.create(name: "store", display_name: "仓库管理员")


admin_user = admin_role.users.build(name: "admin", email: "admin@example.com", password: "123456", password_confirmation: "123456")
admin_user.save
