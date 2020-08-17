class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false 
      t.text :text,null:false 
      t.integer :price,null:false 
      t.references :user,foreign_key:true, null:false
      t.integer :category_id,null:false
      t.integer :item_statue_id,null:false
      t.integer :shipping_charge_id,null:false
      t.integer :prefecture_id,null:false
      t.integer :period_until_shipping_id,null:false
      

      t.timestamps
    end
  end
end


