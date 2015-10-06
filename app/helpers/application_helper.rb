module ApplicationHelper
  
  def fix_url(url)
   if url.starts_with?('http://www')
       url
     elsif  url.starts_with?('www')
        "http://#{url}"
     elsif  url.starts_with?('https:') 
       url
     else 
        "http://www.#{url}"
    end
  end
  
  def display_datetime(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    
    dt.strftime("%A, %e %b %Y, %H:%M, %Z")
  end
  
end
