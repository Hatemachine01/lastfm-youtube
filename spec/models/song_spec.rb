require 'rails_helper'

RSpec.describe Username, type: :model do
  describe "Validations" do 
  	before do 
  		@song = FactoryGirl.create(:song)
  		@username = FactoryGirl.create(:username)
	end

    it "can be created" do 

   	expect(@song).to be_valid
   end

    it "it should have a user associated with it" do 
     @song.username_id = nil
   	
   	 expect(@song).not_to be_valid
   end
 end
end
