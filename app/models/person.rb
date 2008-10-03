require 'basecamp'

class Person
  
  def initialize
  end
  
  def is_waca?(login, password)
    Basecamp.establish_connection!("xcelchurch.seework.com", login, password)
    check_for_project_name("WACA+MEDIA")
  end
  
  def check_for_project_name(name)
    b = Basecamp.new
    b.projects.map{|a| a["name"] }.include? name
  end

end
