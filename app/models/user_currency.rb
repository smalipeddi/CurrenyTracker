class UserCurrency < ActiveRecord::Base
  
  self.primary_key = :code 
  
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true, :scope => :user_id 

  belongs_to :user_country, :foreign_key => :country_id

  def self.collected
    all.select {|user_currency| user_currency.collected? }
  end

  def self.not_collected
    all.reject {|user_currency| user_currency.collected? }
  end

  def collected?
    user_country.nil? ? false : user_country.visited?
  end  
  
  def collected_currency(user_id) 
    country = UserCountry.where(:code=>self.country_id, :user_id=>user_id).first
    return false if country.nil?
    return true if user_country.visited?
    return false 
  end  
  
  def self.collected_in_year(currencies, year,user_id)    
    country_ids = currencies.collect(&:country_id)
    UserCountry.where(:user_id=>user_id, :visited=>true).where("code in (?)",country_ids).where("updated_at >= ?", "#{year}-01-01").where("updated_at <= ?", "#{year}-12-31")    
  end
  
  def self.collected_currencies(currencies, user_id)
    country_ids = currencies.collect(&:country_id) 
    UserCountry.where(:user_id=>user_id, :visited=>true).where("code in (?)",country_ids)  
  end
  
  def self.not_collected_currencies(currencies, user_id)
    country_ids = currencies.collect(&:country_id)
    UserCountry.where(:user_id=>user_id, :visited=>false).where("code in (?)",country_ids)   
  end
   
end
