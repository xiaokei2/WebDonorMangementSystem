class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.datetime :date_received
      t.references :donor_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :donations, [:donor_profile_id, :created_at]
  end
end
