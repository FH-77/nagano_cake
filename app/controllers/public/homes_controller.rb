class Public::HomesController < ApplicationController
  def top
    @item = Item.all.page(params[:page]).per(4)
  end

  def about
  end
end
