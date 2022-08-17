class CreateShipinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipinfos do |t|
      t.string     :post_code,        null: false
      t.integer    :prefectures_id,   null: false
      t.string     :city          ,   null: false
      t.string     :address,          null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.references :order,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
