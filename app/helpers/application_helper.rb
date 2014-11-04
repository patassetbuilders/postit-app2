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
  
  def ozdate(date)
    date.strftime("%A, %e %b %H:%M")
  end
  
end
