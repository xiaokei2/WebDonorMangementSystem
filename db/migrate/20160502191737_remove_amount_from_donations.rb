class RemoveAmountFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :amount, :decimal
  end
end
