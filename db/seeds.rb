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
  Order.destroy(Order.find_by(user_id: example).id)
  Panier.destroy(Panier.find_by(user_id: example).id)
  User.destroy(example)
end
u = User.create(
  prénom: "Crash",
  nom: "Test",
  ville: "Nantes",
  téléphone: "0606060606",
  email: "test@example.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin:"true"
)
u.image_profile.attach(
  io: File.open("app/assets/images/avatar.jpg"),
  filename: "avatar.jpg"
)
pan = Panier.create(user_id: u.id)
7.times do |i|

  plat = Plat.create(user_id: u.id,
    titre: Faker::Food.dish,
    description: Faker::Food.description,
    prix: 9,
    stock: 1,
    plage_horaire: "8h-20h"
  )
  plat.photo_plat.attach(
    io: File.open("app/assets/images/plat#{i}.jpeg"),
    filename: "plat#{i}.jpeg"
  )
  PaniersPlat.create(panier_id: pan.id, plat_id: plat.id, quantité: 1)
  i += 1;

end
Order.create(user_id: u.id, panier_id: pan.id)
