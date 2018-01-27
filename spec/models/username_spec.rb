require 'rails_helper'
include LastFm

RSpec.describe Username, type: :model do
  describe "Validations" do 
  	before do 
  		@username = FactoryGirl.create(:username)
	end

   it "username cannot be nill" do 
   	@username.username = nil

   	expect(@username).not_to be_valid
   end

   it "username must be between 1-15 characters" do 
   	@username.username = '123456789012345677890'

   	expect(@username).not_to be_valid
   end

   it "username must be unique" do 
    @fail_username = FactoryGirl.build(:username)

    expect(@fail_username).not_to be_valid   
   end

   it "validates username using API" do 
    @fail_username = 'idontexist12354'
    validation_result = LastFm.is_username_valid?(@fail_username)


    expect(validation_result).to be(false)   
   end 



  describe "Associations" do 
   it ' should have many songs' do 
   	relation = described_class.reflect_on_association(:songs)
   	
   	expect(relation.macro).to eq(:has_many)
	   end
   end
 end
end
