# -*- encoding: utf-8 -*-
require_relative '../lib/scoring_advice_two'

describe ScoringAdvice do
  describe "#get_scoring_advice" do

    it"Expect sucessful call and have the desired data returned" do
      allow(Unirest).to receive(:get).and_return(status_200)
      desired = {"propensity": 0.26532, "ranking": "C"}
      expect(ScoringAdviceTwo.get_scoring_advice(10000, 60657, 48)).to eq(desired)
    end

    it"Expect a Bad Request string" do
      allow(Unirest).to receive(:get).and_return(status_400)
      desired = "Something went wrong, Bad Request."
      expect(ScoringAdviceTwo.get_scoring_advice("aaaaa", "bbbbb", "cccc")).to eq(desired)
    end

    it"Expect a bad resource string" do
      allow(Unirest).to receive(:get).and_return(status_404)
      desired = "Something went wrong, The resource you requested could not be found."
      expect(ScoringAdviceTwo.get_scoring_advice(nil, nil, nil)).to eq(desired)
    end
  end

  private
  def status_200
    {
      "body":
        {
          "propensity": 0.26532,
          "ranking": "C"
        },
      "code": 200,
      "headers": {}
    }
  end

  def status_400
    {
      "body":
       {
         "status_code": 7,
         "status_message": "Bad Request."
       },
      "code": 400,
      "headers": {}
    }
  end

  def status_404
  {
    "body":
     {
       "status_code": 34,
       "status_message": "The resource you requested could not be found."
     },
   "code": 404,
   "headers": {}
  }
  end

end