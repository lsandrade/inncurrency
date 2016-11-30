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
      conversor.to_brl(3.454798,15.540096).should be_within(0.1).of(0.2167)
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
end
