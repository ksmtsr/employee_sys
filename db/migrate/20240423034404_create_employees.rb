class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birthday, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
