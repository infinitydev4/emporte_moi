# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

PaniersPlat.destroy_all
Plat.destroy_all
if User.find_by(email: "test@example.com")
  example = User.find_by(email: "test@example.com").id
  if Order.find_by(user_id: example)
    Order.destroy(Order.find_by(user_id: example).id)
  end
  if Panier.find_by(user_id: example)
    Panier.destroy(Panier.find_by(user_id: example).id)
  end
  if Comment.find_by(user_id: example)
    Comment.find_by(user_id: example).destroy_all
  end
  User.destroy(example)
end
u = User.create(
  prénom: "Crash",
  nom: "Test",
  ville: "Nantes",
  téléphone: "0665231457",
  email: "test@example.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin:"true"
)
u.image_profile.attach(
  io: File.open("app/assets/images/avatar.jpg"),
  filename: "avatar.jpg"
)

if Restaurant.find_by(email: "resto@example.com")
  resto = Restaurant.find_by(email: "resto@example.com").id
  Restaurant.destroy(resto)
end

r = Restaurant.create(
  nom: "Resto-Test",
  adresse: "2 rue de la Biscuiterie, 44000 Nantes",
  téléphone: "0635214578",
  email: "resto@example.com",
  password: "foobar",
  password_confirmation: "foobar"
)
r.image_resto.attach(
  io: File.open("app/assets/images/avatar-resto.png"),
  filename: "avatar-resto.png"
)
pan = Panier.create(user_id: u.id)
7.times do |i|

  plat = Plat.create(user_id: u.id,
    titre: Faker::Food.dish,
    description: Faker::Food.description,
    prix: rand(1..5),
    stock: rand(1..10),
    plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
  )
  plat.photo_plat.attach(
    io: File.open("app/assets/images/plat#{i}.jpeg"),
    filename: "plat#{i}.jpeg"
  )
  PaniersPlat.create(panier_id: pan.id, plat_id: plat.id, quantité: 1)
  i += 1;

end
Order.create(user_id: u.id, panier_id: pan.id)
