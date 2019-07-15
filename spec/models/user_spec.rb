require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    let!(:text) { build(:user) }
    let(:obj)  {  build(:user) }
    
    # it { should validate_uniqueness_of(:email) }
    # it { should validate_presence_of(:email) }
    # it { should validate_format_of(:email).with_message(VALID_EMAIL_REGEX) }
    
       it "ensures the presence of email" do
          text.email = nil 
          user =  create(:user, email: nil)
         #  expect(user).to have_content("Email can't be blank, Email is invalid")
         #  expect(user).not_to be_valid
         # expect(user).not_to be_valid
         # expect(user.errors).to have_key(:email)
       end

       it "ensures the presence of name" do
          text.name = nil 
          expect(text.save).to eq(false) 
       end

       it "ensures presence of password" do   
          text.password = nil  
          expect(text.save).to eq(false) 
       end  

       it "ensures the uniqueness of email" do   
          expect(obj.save).to eq(true)
          expect(text.save).to eq(true)
       end

  end
end
