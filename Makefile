ENV=test

recreate-db: remove-db create-db

remove-db:
	rails app:db:environment:set RAILS_ENV=$(ENV)
	rails app:db:drop RAILS_ENV=$(ENV)

create-db:
	rails app:db:create RAILS_ENV=$(ENV)
	rails app:db:migrate RAILS_ENV=$(ENV)

dummy-server:
	(cd spec/dummy && rails server)
