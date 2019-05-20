class RoomsController < ApplicationController
  def show
    @currency = Currency.actual['currency']
  end

  def admin
    @expired = Currency.actual
  end
  
end