class Object
  ##
  #   From http://ozmm.org/posts/try.html
  #   @person ? @person.name : nil
  # vs
  #   @person.try(:name)
  def try(method)
    send method if respond_to? method
  end
end