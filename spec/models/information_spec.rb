require 'rails_helper'

RSpec.describe Information, type: :model do
  context "validation tests" do
    let(:text) { build(:information)}
   # let(:text) { create(:note)}
   # let(:text) { build(:random_description, 2) }

    it "ensures presence of the rating during creation" do 
         text.rating = nil
         expect(text.save).to eq(false)  
    end

    it "ensures presence of the comment during creation" do 
      text.comment = nil
      expect(text.save).to eq(false)  
    end

    it "ensures presence of the rating and comment during creation" do 
      text.comment = nil
      text.rating = nil
      expect(text.save).to eq(false)  
    end

    it "condition to be true when rating and comments are present during creation" do 
      expect(text.save).to eq(true)  
    end

    it "ensures the lenght of the numericallity of rating during creation" do   
      text.rating = "I am a text"
      expect(text.save).to eq(false)
    end

    it "ensure the rating to be held between 1 to 5 during creation " do   
      text.rating = 100
      expect(text.save).to eq(false)
    end

  
    # it "ensures the database count" do
    #   expect(text.all.size).to eq(0)
    # end     

 end
end
