class UserCountry < ActiveRecord::Base 
   
  self.primary_key = :code 
  belongs_to :user 
  
  scope :visited, -> { where(visited: true) }
  scope :not_visited, -> { where(visited: false) }
  
  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true, :scope => :user_id 

  has_many :user_currencies

  accepts_nested_attributes_for :user_currencies, :allow_destroy => true 
 
  
  def self.visited_in_year(year)    
    all.where("updated_at >= ?", "#{year}-01-01").where("updated_at <= ?", "#{year}-12-31")
  end
   
end
