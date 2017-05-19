class RemoveDateCreatedFromDonorProfiles < ActiveRecord::Migration
  def change
    remove_column :donor_profiles, :date_created, :datetime
  end
end
