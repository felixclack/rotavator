module ApplicationHelper
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, flash[msg.to_sym], :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
  def actions_for_participation(participation)
    raise "Not a participation" unless participation.is_a? Participation
    case participation.state.to_sym
    when :assigned
      haml_tag :div do
        puts link_to("Confirm", confirm_participation_path(participation), :method => :put)
        puts link_to("Decline", decline_participation_path(participation), :method => :put)
      end
    when :confirmed
      haml_tag :div do
        puts link_to("Decline", decline_participation_path(participation), :method => :put)
      end
    when :declined
      haml_tag :div do
        puts link_to("I am available", confirm_participation_path(participation), :method => :put)
      end
    end
  end
  
end
