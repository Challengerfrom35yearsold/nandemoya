class Customer::HomesController < ApplicationController
  def top
    @item_genres = ItemGenre.all
    @items = Item.last(6)
  end

  def about
  end
end
