require "scoring_advice_two/version"
require "unirest"
require 'pry'

module ScoringAdvice
    extend self

    def get_scoring_advice(income, zipcode, age)
      response = Unirest.get("https://not_real.com/customer_scoring?income=#{income}&zipcode=#{zipcode}&age=#{age}")

      if response[:code] != 200
        "Something went wrong, #{response[:body][:status_message]}"
      else
        response[:body]
      end
    end
end