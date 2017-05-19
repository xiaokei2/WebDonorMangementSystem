class DonationsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit]
    
    def create
      @donor_profile = DonorProfile.find_by(id: params[:donor_profile_id])
      @donation = @donor_profile.donations.build(donation_params)
      if @donation.save
        flash[:success] = "Donation added!"
        redirect_to donor_profile_path(@donor_profile)
      else 
        flash[:danger] = "Donation must be greater than $0.00"
        redirect_to donor_profile_path(@donor_profile)
      end
    end
    
    def destroy
      @donation = Donation.find_by(id: params[:id])
      @donor_profile = @donation.donor_profile
      @donation.destroy
      flash[:success] = "Donation deleted"
      redirect_to donor_profile_path(@donor_profile)
    end
    
    def edit
    end
    
    private
        
      def donation_params
        params.require(:donation).permit(:amount, :cause, :date_received)
      end
end
