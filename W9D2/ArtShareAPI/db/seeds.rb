# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    
    Artwork.destroy_all
    ArtworkShare.destroy_all
    User.destroy_all
    Like.destroy_all
    
    puts 'Loading users...'
    u1 = User.create!(username: 'Brock')
    u2 = User.create!(username: 'Chas')

    puts 'Loading Artwork...'
    a1 = Artwork.create!(title: 'Mona Lisa', image_url: 'thelouvre.fr', artist_id: u1.id)
    a2 = Artwork.create!(title: 'The Starry Night', image_url: 'thelouvre.fr/van_gogh', artist_id: u2.id)
    a3 = Artwork.create!(title: 'Guernica', image_url: 'thelouvre.fr/Guernica', artist_id: u2.id)

    puts 'Loading Shares...'
    ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
    ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)

    puts 'Loading Likes...'
    Like.create!(user_id: u1.id, likeable_id: a1.id, likeable_type: 'Artwork')
    Like.create!(user_id: u2.id, likeable_id: a2.id, likeable_type: 'Artwork')
    Like.create!(user_id: u1.id, likeable_id: a2.id, likeable_type: 'Artwork')
    Like.create!(user_id: u2.id, likeable_id: a1.id, likeable_type: 'Artwork')
    Like.create!(user_id: u1.id, likeable_id: a3.id, likeable_type: 'Artwork')