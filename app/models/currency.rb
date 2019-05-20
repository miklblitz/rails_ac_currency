class Currency < ApplicationRecord
    #after_create_commit { CurrencyBroadcastJob.perform_later self }
    # after_update_commit { MessageBroadcastJob.set(wait_until: Time.now + 10.seconds).perform_later self }

    enum source: [:cron, :user]

    validates :source, presence: true
    validates :currency, presence: true, numericality: true

    scope :actual, ->{ order("updated_at desc").first }

    # set crontab
    # whenever --update-crontab --set environment='development'
    def self.bank_currency
        require 'open-uri'
        doc = Nokogiri::XML(open("http://www.floatrates.com/daily/rub.xml"))
        items = doc.xpath("//item//inverseRate")
        if items[0].present?
            currency = self.where(source: 0).first_or_initialize
            currency.currency = "%.2f" % items[0].text
            currency.updated_at = Time.now
            currency.save

            actual_currency = Currency.actual
            ActionCable.server.broadcast 'room_channel', currency: actual_currency['currency']
        end
    end

end