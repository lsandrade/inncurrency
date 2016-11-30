class Conversor < ActiveRecord::Base
  @@API_KEY = "86a2d0814613df7f6459de5656a60970"

  def hello_api
    @@API_KEY
  end
end
