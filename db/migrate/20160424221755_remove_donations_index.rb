class RemoveDonationsIndex < ActiveRecord::Migration
  def change
    remove_index :donations, :donor_profile_id
  end
end
