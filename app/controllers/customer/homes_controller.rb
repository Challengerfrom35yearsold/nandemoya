class Customer::HomesController < ApplicationController
  def top
    @item_genres = ItemGenre.all
    @items = Item.where(is_active: true).last(6)
  end
end
