namespace :db do
	desc "Fill database with simple data"
	task populate: :environment do
		make_users
		make_micropost
		make_relationships
	end
end

	def make_users
		User.create!(name: "Ashley Carrington",
				email: "ashley.r.carrington@gmail.com",
				password: "123456",
				password_confirmation: "123456",
				admin: true)

		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n}@dummy.com"
			password = "123456"

			User.create!(name: name, email: email, password: password, password_confirmation: password)
		end
	end

	def make_micropost
		users = User.limit(6).all
		50.times do
			users.each do |user|
				content = Faker::Lorem.sentence(6)
				user.microposts.create!(content: content)
			end
		end
	end

	def make_relationships
		users = User.all
		user = users.first
		followed_users = users[2..50]
		followers      = users[3..40]
		followed_users.each { |followed| user.follow!(followed) }
		followers.each      { |follower| follower.follow!(user) }

	end
	
