class AddStateToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :state, :integer
    add_index :offers, :state
  end
end
