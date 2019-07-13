require 'rails_helper'

RSpec.describe Movieinfo, type: :model do
  context "validation tests" do
    let(:text) { build(:movieinfo)}
   # let(:text) { create(:note)}
   # let(:text) { build(:random_description, 2) }

    it "ensures presence of the moviename" do 
         text.moviename = nil
         expect(text.save).to eq(false)  
    end

    it "expected to save when moviename is present" do    
         expect(text.save).to eq(true)
    end

    # it "ensures the database count" do
    #   expect(text.all.size).to eq(0)
    # end     

 end
end
