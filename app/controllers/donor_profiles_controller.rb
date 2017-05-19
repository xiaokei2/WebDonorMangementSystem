class DonorProfilesController < ApplicationController

  def donor_profile_params
    params.require(:donor_profile).permit(:first_name, :last_name, :description,
                                            :date_created, :address, :phone_number,
                                            :email, :donation_interests, :sort_type, 
                                            donations_attributes: [:amount, :created_at])
  end

  def show
    @donor_profile = DonorProfile.find(params[:id]) # look up donor_profile by unique ID
    @donation = @donor_profile.donations.build if logged_in?
    @donations = @donor_profile.donations.paginate(page: params[:page])
  end

  def index
    @donor_profile = DonorProfile.new
    #if there is a sort type, set the session
    if params[:search]
      @donor_profiles = DonorProfile.search(params[:search]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
    else
      @donor_profiles = DonorProfile.paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
    end
  end

  def new
  end

  def create
    @donor_profile = DonorProfile.new(donor_profile_params)
    if @donor_profile.save
      flash[:success] = "#{@donor_profile.fullname} was successfully created."
      redirect_to donor_profiles_path
    else
      render '_new_donor_form'
    end
  end

  def edit
    @donor_profile = DonorProfile.find params[:id]
  end

  def update
    @donor_profile = DonorProfile.find params[:id]
    if @donor_profile.update_attributes(donor_profile_params)
      flash[:success] = "#{@donor_profile.fullname} was successfully updated."
      redirect_to donor_profile_path(@donor_profile)
    else
      render 'edit'
    end
  end

  def destroy
    @donor_profile = DonorProfile.find(params[:id])
    @donor_profile.destroy
    flash[:info] = "DonorProfile '#{@donor_profile.first_name}' deleted."
    redirect_to donor_profiles_path
  end
  
  private
    def sort_column
      DonorProfile.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
