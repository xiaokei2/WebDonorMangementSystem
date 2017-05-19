require 'spec_helper'

describe DonorProfile do
  
  before :each do
      @donor_profile = DonorProfile.new "First Name", "Last Name", :description, :date_created
  end
  
  describe "#new" do
    it "returns a new donor profile" do
      @donor_profile.should( be_an_instance_of( DonorProfile))
    end
    
    it "throws an ArgumentError when given less than 4 parameters" do
      lambda {DonorProfile.new "First Name", "Last Name", :description}.should raise_exception ArgumentError
    end
  
  end
 
  describe "#first_name" do
    it "returns the correct first name" do
      @donor_profile.first_name.should eql "First Name"
    end
  end
  
  describe "#last_name" do
    it "returns the correct last name" do
      @donor_profile.last_name.should eql "Last Name"
    end
  end
  
  describe "#description" do
    it "returns the correct description" do
      @donor_profile.description.should eql :description
    end
  end
  
end
