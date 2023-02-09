class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all.page(params[:page]).per(10)
  end

  def show
    
  end

  def edit
  end
end
