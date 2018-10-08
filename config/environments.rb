#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['postgres://nzoqoyhyfinbzh:9ad30a6920b4f44f8af4c4f4d910654daaed4aa8c089799b711d0b19a711fba0@localhost:5432/d7qh62m35rrl8g
'] || 'postgres://guestbook_user:panther@localhost:8080/guestbook')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end