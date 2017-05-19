class AddCauseToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :cause, :string
  end
end
