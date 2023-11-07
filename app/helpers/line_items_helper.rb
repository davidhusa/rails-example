module LineItemsHelper
  def previous_page_link(page)
    change_page_link("Previous", page - 1)
  end

  def next_page_link(page)
    change_page_link("Next", page + 1)
  end

  def change_page_link(text, page)
    link_params = { page: page }
    link_to text, line_items_path(params: link_params, rel: "next")
  end
end
