require 'basecamp'

module BasecampAuthorisation
  
  def authenticate(site, login, password)
    Basecamp.establish_connection!(site, login, password)
    m = Basecamp::Message.list(154701)
    if m.size > 0
      return true
    else
      return false
    end
  end
  
end