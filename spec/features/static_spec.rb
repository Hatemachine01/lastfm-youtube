require 'rails_helper'
describe 'navigate' do 
	describe 'homepage' do 
		it 'can be reached succesfully' do 
			visit root_path
			expect(page.status_code).to eq(200)
		end

		it "has a form to submit lastfm username" do 
			visit root_path
			
			expect(page).to have_content(/Username/)
		end


		it 'form cannot be submited if blank' do 
			visit root_path

			click_on 'Submit'
			expect(current_path).to eq(root_path)
		end
	end
end