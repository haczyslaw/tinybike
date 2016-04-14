class MessagesDatatable
  delegate :params, :link_to, :message_path, :show_options, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Message.count,
      iTotalDisplayRecords: messages.total_entries,
      aaData: data
    }
  end

  private

  def data
    messages.map do |message|
      [
        link_to(message.id, message_path(message)),
        message.bike_id,
        message.body[0..200],
        show_options(message)
      ]
    end
  end

  def messages
    @messages ||= fetch_messages
  end

  def fetch_messages
    messages = Message.order("#{sort_column} #{sort_direction}")
    messages = messages.page(page).per_page(per_page)
    if params[:sSearch].present?
      messages = messages.where("bike_id LIKE %?% OR body LIKE %?%", params[:sSearch], params[:sSearch])
    end
    messages
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def order
    @order ||= if params[:order] && params[:order]['0']
      params[:order]['0']
    else
      { 'column' => 0, 'dir' => 'desc' }
    end
  end

  def sort_column
    columns = %w(id bike_id body id)
    columns[order['column'].to_i]
  end

  def sort_direction
    order['dir'] == "desc" ? "DESC" : "ASC"
  end
end
