class CreateDonorProfiles < ActiveRecord::Migration
  def change
    create_table :donor_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.datetime :date_created
      # Add fields that let Rails automatically keep track
      # of when donor_profiles are added or modified:
      t.timestamps
    end
  end
end