class MonetizeDonation < ActiveRecord::Migration
  def change
    add_monetize :donations, :amount, currency: { present: false }
  end
end
