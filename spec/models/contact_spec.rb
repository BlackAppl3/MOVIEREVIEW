require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "validation test for create " do
    let(:text) { build(:contact)}

    it "ensures the presence of the email" do    
      text.email = nil 
      expect(text.save).to eq(false) 
    end

    it "ensures the presence of the comment" do   
      text.comment = nil 
      expect(text.save).to eq(false)
    end

    it "ensures the presence of both email and comment" do  
       text.email = nil 
       text.comment = nil 
       expect(text.save).to eq(false)
    end

    it "expected to save when we have both email and comment" do   
       expect(text.save).to eq(true)
    end
    
  end
  
end
