class AddIndexToDonorProfilesEmail < ActiveRecord::Migration
  def change
    add_index :donor_profiles, :email, unique:true
  end
end
