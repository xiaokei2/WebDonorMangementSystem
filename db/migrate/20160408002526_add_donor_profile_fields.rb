class AddDonorProfileFields < ActiveRecord::Migration
  def change
    add_column :donor_profiles, :address, :string
    add_column :donor_profiles, :phone_number, :string
    add_column :donor_profiles, :email, :string
    add_column :donor_profiles, :donation_interests, :string
  end
end
