module ApplicationHelper
  
  def select_all_for_currencies  
    return true if current_user.user_countries.size == current_user.user_countries.visited.size
    return false
  end
  
end
