require 'open-uri'
require 'json'


class Conversor < ActiveRecord::Base
  @@API_KEY = "86a2d0814613df7f6459de5656a60970"

  def hello_api
    @@API_KEY
  end

  def get_exchange
    stream = open(
      "http://apilayer.net/api/historical?"+
      "&date=2016-11-29"+
      "&currencies=EUR,BRL,ARS"+
      "&access_key="+@@API_KEY
      )
    data = stream.read
    json = JSON.parse(data)
  end

  def to_brl(usdbrl,currency)
    return usdbrl / currency
  end

  def get_exchange_by_date(date)
    stream = open(
      "http://apilayer.net/api/historical?"+
      "&date="+date+
      "&currencies=EUR,BRL,ARS"+
      "&access_key="+@@API_KEY
      )
    data = stream.read
    json = JSON.parse(data)
    return json
  end

  def get_exchange_by_coin_and_date(coin,date)
    json = get_exchange_by_date(date)
    if coin == "USD" then return json['quotes']['USDBRL'] end
    return to_brl(json['quotes']['USDBRL'],json['quotes']['USD'+coin])
  end

  def get_dates(start)
    d = Date.parse(start.gsub(/, */, '-'))
    d = d-6
    dates = []
    7.times do
      dates.append(d.to_s)
      d += 1
    end
    return dates
  end

  def get_exchange_formatted(coin)
    dates = get_dates(Date.today.to_s)
    exchanges = []
    for date in dates do
      exchanges.append(get_exchange_by_coin_and_date(coin,date))
    end
    return {name: coin, data: exchanges}
  end
end
