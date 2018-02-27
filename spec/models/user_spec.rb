require 'spec_helper'

describe User do
	before { @user = FactoryGirl.build(:user) }

	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "#products association" do

		before do
			@user.save
			3.times { FactoryGirl.create :product, user: @user }
		end

		it "destroys the associated products on self destruct" do
			products = @user.products
			@user.destroy
			products.each do |product|
				expect(Product.find(product)).to raise_error ActiveRecord::RecordNotFound
			end
		end
	end

end


# describe "when email is not present" do
#   before { @user.email = " " }
#   it { should_not be_valid }
# end