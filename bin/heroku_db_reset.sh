heroku pg:reset --app splathon

heroku run rails db:migrate --app splathon

heroku psql --app splathon < db/splathon.dump
