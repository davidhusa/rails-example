module LineItemsHelper
  def filter_message
    message = []
    message << "line item name by \"#{params[:name_filter]}\"" if params[:name_filter].present?
    message << "campaign name by \"#{params[:campaign_name_filter]}\"" if params[:campaign_name_filter].present?

    return if message.empty?

    "Currently filtering #{message.join(" and ")}"
  end
end
