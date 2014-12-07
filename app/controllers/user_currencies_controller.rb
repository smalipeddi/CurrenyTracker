class UserCurrenciesController < ApplicationController
  before_action :set_user_currency, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index 
    @user_currencies = current_user.user_currencies    
  end

  def show
    respond_with(@user_currency)
  end 

  def edit
  end

  def create
    @user_currency = UserCurrency.new(user_currency_params)
    @user_currency.save
    respond_with(@user_currency)
  end

  def update
    @user_currency.update(user_currency_params)
    respond_with(@user_currency)
  end
   
  def update_collected
    if params[:country_code].to_s == "update_all" 
      current_user.user_countries.each do |c|
        c.update_attribute(:visited, params[:visited])
      end 
    else
      country = current_user.user_countries.find_by_code params[:country_code]
      country.update_attribute(:visited, params[:visited])
    end 
    
    @user_currencies = current_user.user_currencies.where("name like'#{params[:search_text]}%'")
  end

  def filter_currencies
    @user_currencies = current_user.user_currencies.where("name like'#{params[:search_text]}%'")
  end

  private
    def set_user_currency
      @user_currency = UserCurrency.where(:code => params[:id], :user_id =>current_user.id).first 
    end

    def user_currency_params
      params.require(:user_currency).permit(:user_id, :name, :code, :country_id)
    end
end
