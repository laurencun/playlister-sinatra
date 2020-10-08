# Add seed data here. Seed your database with `rake db:seed`

Artist.destroy_all
Song.destroy_all
Genre.destroy_all
SongGenre.destroy_all


LibraryParser.parse