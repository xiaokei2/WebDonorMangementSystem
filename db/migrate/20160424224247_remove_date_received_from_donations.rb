class RemoveDateReceivedFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :date_received, :datetime
  end
end
