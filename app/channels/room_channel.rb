class RoomChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "room_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def currency(data)
    Currency.record_timestamps=false
    currency = Currency.where(source: 'user').first_or_initialize
    currency.currency = "%.2f" % data['currency']
    currency.created_at = Time.now
    currency.updated_at = data['expired']
    currency.source=1
    currency.save
    Currency.record_timestamps=true

    actual_currency = Currency.actual
    ActionCable.server.broadcast "room_channel", currency: actual_currency['currency']
  end

end
