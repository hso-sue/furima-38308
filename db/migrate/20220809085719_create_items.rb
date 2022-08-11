class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,         null: false
      t.text       :introduction,      null: false
      t.integer    :item_category_id,  null: false
      t.integer    :item_condition_id, null: false
      t.integer    :postage_payer_id,  null: false
      t.integer    :sender_area_id,    null: false
      t.integer    :preparation_id,    null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
