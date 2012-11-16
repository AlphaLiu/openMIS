class Userinfo < ActiveRecord::Base
  attr_accessible :cellphone, :gender, :home_phone, :id_num, :join_date, :office_phone, :real_name

  belongs_to :user
end
