class User < ActiveRecord::Base
 	validates :email, :uniqueness => true

	def self.authenticate(email, password)
	 	user = User.find_by(email: email)
		if user != nil
			if user.password == password
				user
			else
				nil
			end
		end
	end
end
