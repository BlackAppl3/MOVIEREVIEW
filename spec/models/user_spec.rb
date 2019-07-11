require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    let(:text) { build(:user)}
    
    # it { should validate_uniqueness_of(:email) }
    # it { should validate_presence_of(:email) }
    # it { should validate_format_of(:email).with_message(VALID_EMAIL_REGEX) }


       it "ensures the presence of email" do
          text.email = nil 
          expect(text.save).to eq(false) 
       end

       it "ensures the presence of name" do
          text.name = nil 
          expect(text.save).to eq(false) 
       end

       it "ensures presence of password" do   
          text.password = nil  
          expect(text.save).to eq(false) 
       end  
  end
end
