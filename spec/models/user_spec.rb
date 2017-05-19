require 'rails_helper'

RSpec.describe User, type: :model do
    
  before :each do 
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  it "is valid" do
    expect @user.valid?
  end
end
