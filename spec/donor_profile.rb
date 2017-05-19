class DonorProfile 
  attr_accessor :first_name, :last_name, :description, :date_created
  
  def initialize first_name, last_name, description, date_created
    @first_name = first_name
    @last_name = last_name
    @description = description
  end
 	
end
