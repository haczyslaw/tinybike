module MessagesHelper
  def show_options(message)
    [
      link_to('Show', message),
      link_to('Edit', edit_message_path(message)),
      link_to('Destroy', message, :method => :delete, :data => { :confirm => 'Are you sure?' })
    ].join(' | ')
  end
end
