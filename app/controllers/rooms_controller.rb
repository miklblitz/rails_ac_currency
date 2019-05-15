class RoomsController < ApplicationController
  def show
    @currency = Currency.actual['currency']
  end

  def admin
    @expired = Currency.where(source: 'user').first
  end
  
end