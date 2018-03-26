require 'rails_helper'
describe 'navigate' do 
	describe 'homepage' do 
		before do 
  			@username = FactoryGirl.create(:username)
  		end	
		it 'can be reached succesfully' do 
			visit root_path
			expect(page.status_code).to eq(200)
		end

		it "has a form to submit lastfm username" do 
			visit root_path
			
			expect(page).to have_content(/Username/)
		end

		it "it should not create more songs for the user if the user already exists" do 
    		visit root_path
    		fill_in 'username[username]', with: "acdcfuckinrocks"
    		
    		expect{ click_on 'Submit'}.to change(Song, :count).by(0)
   		end 

   		it "it should have a link to perform another username lookup" do 
    		visit root_path
    		fill_in 'username[username]', with: "acdcfuckinrocks"
    		click_on 'Submit'
    		
    		click_link("Another search")
    		
    		expect(page.status_code).to eq(200)
   		end     
	end
end