require 'spec_helper'

describe Api::V1::SessionsController do

	describe "GET #index" do
		before(:each) do
			4.times { FactoryGirl.create :product }
			get :index
		end

		it "returns 4 records from the database" do
			products_response = json_response
			expect(products_response[:products]).to have(4).items
		end

		it { should respond_with 200 }
	end
end

end
