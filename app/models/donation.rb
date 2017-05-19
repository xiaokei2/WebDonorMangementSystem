class Donation < ActiveRecord::Base
  belongs_to :donor_profile
  default_scope -> { order(date_received: :desc) }
  validates :donor_profile_id, presence: true
  validates :amount, numericality: { greater_than: 0.00 }
  
  monetize :amount_cents, :as => "amount"
end
