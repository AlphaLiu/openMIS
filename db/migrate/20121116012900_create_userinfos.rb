class CreateUserinfos < ActiveRecord::Migration
  def change
    create_table :userinfos do |t|
      t.string :real_name, default: ""
      t.string :gender, default: ""
      t.string :id_num, default: ""
      t.string :office_phone, default: ""
      t.string :home_phone, default: ""
      t.string :cellphone, default: ""
      t.date :join_date
      t.integer :user_id

      t.timestamps
    end
  end
end
