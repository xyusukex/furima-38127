class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.integer    :price,              null: false
      t.integer    :delivery_charge_id, null: false
      t.text       :explanation,        null: false
      t.integer    :category_id,        null: false
      t.integer    :quality_id,         null: false
      t.integer    :province_id,           null: false
      t.integer    :shipping_date_id,   null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
