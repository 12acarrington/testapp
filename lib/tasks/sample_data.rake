namespace :db do
	desc "Fill database with simple data"
	task populate: :environment do
		User.create!(name: "Ashley Carrington",
			email: "ashley.r.carrington@gmail.com",
			password: "123456",
			password_confirmation: "123456",
			admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n}@dummy.com"
			password = "123456"

			User.create!(name: name, email: email, password: password,
			 password_confirmation: password)
		end

		users = User.limit(6).all
		50.times do
			users.each do |user|
				content = Faker::Lorem.sentence(6)
				user.microposts.create!(content: content)
			end
		end

	end
end