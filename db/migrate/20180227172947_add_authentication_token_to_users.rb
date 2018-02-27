class AddAuthenticationTokenToUsers < ActiveRecord::Migration
	def change
		add_column :users, :auth_token, :string, default: ""
		add_index :users, :auth_token, unique: true
	end

	def generate_authentication_token!
		begin
			self.auth_token = Devise.friendly_token
		end while self.class.exists?(auth_token: auth_token)
	end

end
