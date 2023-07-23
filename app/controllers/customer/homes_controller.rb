class Customer::HomesController < ApplicationController
  def top
    @item_genres = ItemGenre.all
  end

  def about
  end
end
