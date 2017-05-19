class DonorProfile < ActiveRecord::Base
    attr_accessor :donations_attributes
    has_many :donations, dependent: :destroy
    accepts_nested_attributes_for :donations
    VALID_PHONE_REGEX = /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    def fullname
      "#{first_name} #{last_name}"
    end
    
    def donations_sum
      sum = donations.sum(:amount_cents)
      Money.new(sum, "USD")
    end
    
    def donor_interests
      Donation.uniq.pluck(:cause)
    end
    
    def self.search(search)
      where("first_name LIKE :search OR last_name LIKE :search", search: "%#{search}%")
    end
end
