class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, unique: true
      t.string :url
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :premium

      t.timestamps
    end
  end
end
