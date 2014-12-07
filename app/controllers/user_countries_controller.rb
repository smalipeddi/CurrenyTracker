class UserCountriesController < ApplicationController
  before_action :set_user_country, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @user_countries = current_user.user_countries
    respond_with(@user_countries)
  end

  def show
    respond_with(@user_country)
  end 
  
  def edit
  end

  def create
    @user_country = UserCountry.new(user_country_params)
    @user_country.save
    respond_with(@user_country)
  end

  def update
    @user_country.update(user_country_params)
    respond_with(@user_country)
  end

  def update_visited 
    if params[:country_code].to_s == "update_all" 
      current_user.user_countries.each do |c|
        c.update_attribute(:visited, params[:visited])
      end 
    else
      country = current_user.user_countries.find_by_code params[:country_code]
      country.update_attribute(:visited, params[:visited])
    end 
    @user_countries = current_user.user_countries.where("name like'#{params[:search_text]}%'")   
  end
  
  def filter_countries
    @user_countries = current_user.user_countries.where("name like'#{params[:search_text]}%'") 
  end

  private
    def set_user_country
      @user_country = UserCountry.where(:code=>params[:id], :user_id =>current_user.id).first
    end

    def user_country_params
      params.require(:user_country).permit(:user_id, :name, :code, :visited)
    end
end
