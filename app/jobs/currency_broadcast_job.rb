class CurrencyBroadcastJob < ApplicationJob
  queue_as :default

  def perform(currency)
    ActionCable.server.broadcast 'room_channel', currency: currency.currency
  end
end
