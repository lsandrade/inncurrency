require 'rails_helper'

RSpec.describe Conversor, type: :model do
  context "Hello" do
    it "hello world" do
      puts "Give my money back!"
    end
  end

  context "Convert to BRL" do
    it "ARS to BRL" do
      conversor = Conversor.new
      conversor.to_brl(3.454798,15.540096).should be_within(0.05).of(0.2167)
    end
  end

  context "Get exchange" do
    it "29-11-2016" do
      conversor = Conversor.new
      exchange = conversor.get_exchange

      expect(exchange).to eql(JSON.parse("{
        \"success\":true,
        \"terms\":\"https:\/\/currencylayer.com\/terms\",
        \"privacy\":\"https:\/\/currencylayer.com\/privacy\",
        \"historical\":true,
        \"date\":\"2016-11-29\",
        \"timestamp\":1480463999,
        \"source\":\"USD\",
        \"quotes\":{
          \"USDEUR\":0.938973,
          \"USDBRL\":3.454798,
          \"USDARS\":15.540096
        }
      }"))
    end
  end

  context "Get exchange by date" do
    it "usd to brl in 29-11-2016" do
      conversor = Conversor.new
      exchange = conversor.get_exchange_by_date('2016-11-29')
      exchange['quotes']['USDBRL'].should be_within(0.05).of(3.45)
    end

    it "usd to brl in 28-11-2016" do
      conversor = Conversor.new
      exchange = conversor.get_exchange_by_date('2016-11-28')
      exchange['quotes']['USDBRL'].should be_within(0.05).of(3.40)
    end
  end

  context "Get exchange by coin and date" do
    it "ars to brl in 29-11-2016" do
      conversor = Conversor.new
      conversor.get_exchange_by_coin_and_date('ARS','2016-11-29').should be_within(0.05).of(0.2167)
    end
    it "usd to brl in 29-11-2016" do
      conversor = Conversor.new
      conversor.get_exchange_by_coin_and_date('USD','2016-11-29').should be_within(0.05).of(3.45)
    end
    it "eur to brl in 29-11-2016" do
      conversor = Conversor.new
      conversor.get_exchange_by_coin_and_date('EUR','2016-11-29').should be_within(0.05).of(3.67)
    end
  end

  context "Get categories" do
    it "Last seven days" do
      conversor = Conversor.new
      expect(conversor.get_dates('2016-11-30')).to eql(['2016-11-24','2016-11-25','2016-11-26','2016-11-27','2016-11-28','2016-11-29','2016-11-30'])
    end
  end
end
