class LineItemsController < ApplicationController
  PAGE_SIZE = 100

  def index
    @max_page = LineItem.count.to_f / PAGE_SIZE
    @page = params[:page].present? ? params[:page].to_i : 0
    @line_items = LineItem.includes(:campaign).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
  end
end
