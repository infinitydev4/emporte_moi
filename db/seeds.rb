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
Search.destroy_all
Category.destroy_all
Comment.destroy_all
if User.find_by(email: "test@example.com")
  example = User.find_by(email: "test@example.com").id
  if Order.find_by(user_id: example)
    Order.destroy(Order.find_by(user_id: example).id)
  end
  if Panier.find_by(user_id: example)
    Panier.destroy(Panier.find_by(user_id: example).id)
  end
  if Comment.find_by(user_id: example)
    Comment.destroy(Comment.find_by(user_id: example).id)
  end
  User.destroy(example)
end
if User.find_by(email: "albert@example.com")
  example2 = User.find_by(email: "albert@example.com").id
  if Order.find_by(user_id: example2)
    Order.destroy(Order.find_by(user_id: example2).id)
  end
  if Panier.find_by(user_id: example2)
    Panier.destroy(Panier.find_by(user_id: example2).id)
  end
  if Comment.find_by(user_id: example2)
    Comment.destroy(Comment.find_by(user_id: example2).id)
  end
  User.destroy(example2)
end
u = User.create(
  prénom: "Oscar",
  nom: "Ousel",
  ville: "Nantes",
  adresse: "3 rue Sanlecque, 44000 Nantes",
  téléphone: "0665231457",
  email: "test@example.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin:"true"
)
u.image_profile.attach(
  io: File.open("app/assets/images/avatar2.jpg"),
  filename: "avatar2.jpg"
)

u2 = User.create(
  prénom: "Albert",
  nom: "Thym",
  ville: "Nantes",
  adresse: "4 Rue des Halles, 44000 Nantes",
  téléphone: "0665231457",
  email: "albert@example.com",
  password: "foobar",
  password_confirmation: "foobar",
)
u2.image_profile.attach(
  io: File.open("app/assets/images/avatar3.jpg"),
  filename: "avatar3.jpg"
)

if Restaurant.find_by(email: "resto@example.com")
  resto = Restaurant.find_by(email: "resto@example.com").id
  Restaurant.destroy(resto)
end

r = Restaurant.create(
  nom: "Lieu Unique",
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
pan2 = Panier.create(user_id: u2.id)

tomates = Plat.create(user_id: u.id,
  titre: "Tomates Farcies",
  description: "Tomates chaudes farcies d'une farce de bœuf avec des oignons et de l'ail",
  prix: 4,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
tomates.photo_plat.attach(
  io: File.open("app/assets/images/plat0.jpeg"),
  filename: "plat0.jpeg"
)

bourgui = Plat.create(user_id: u2.id,
  titre: "Boeuf Bourguignon",
  description: "Cuisine d'estouffade de boeuf, traditionnelle de la cuisine bourguignonne, cuisinée au vin rouge de Bourgogne, avec une garniture de champignons, de petits oignons et de lardons.",
  prix: 6,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
bourgui.photo_plat.attach(
  io: File.open("app/assets/images/plat1.jpeg"),
  filename: "plat1.jpeg"
)

boeuf = Plat.create(user_id: u.id,
  titre: "Boeuf en sauce",
  description: "Marmite de boeuf surcuit avec sauce marchand de vin servit avec des oignons frits et des frites.",
  prix: 5,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
boeuf.photo_plat.attach(
  io: File.open("app/assets/images/plat2.jpeg"),
  filename: "plat2.jpeg"
)

endive = Plat.create(user_id: u2.id,
  titre: "Endives au jambon",
  description: "Gratin d'endives au jambon avec sauce béchamel.",
  prix: 3,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
endive.photo_plat.attach(
  io: File.open("app/assets/images/plat3.jpeg"),
  filename: "plat3.jpeg"
)

saumon = Plat.create(restaurant_id: r.id,
  titre: "Pavé de saumon",
  description: "Pavé de saumon servit avec des haricots verts et une farces d'échalottes.",
  prix: 7,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
saumon.photo_plat.attach(
  io: File.open("app/assets/images/plat4.jpeg"),
  filename: "plat4.jpeg"
)

lasagnes = Plat.create(restaurant_id: r.id,
  titre: "Lasagnes traditionnelles",
  description: "Lasagnes classiques avec boeuf, coulis de tomate et basilic.",
  prix: 2,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
lasagnes.photo_plat.attach(
  io: File.open("app/assets/images/plat5.jpeg"),
  filename: "plat5.jpeg"
)

paella = Plat.create(user_id: u.id,
  titre: "Paella de la mer",
  description: "Paella avec moules, langoustines, encornets et petit poids.",
  prix: 3,
  stock: rand(1..5),
  plage_horaire: "#{rand(8..12)}h-#{rand(14..22)}h"
)
paella.photo_plat.attach(
  io: File.open("app/assets/images/plat6.jpeg"),
  filename: "plat6.jpeg"
)

Comment.create(user_id: u.id, body: "Très bons plats ! Je recommande les yeux fermés.", auteur_id: u2.id)
Comment.create(user_id: u.id, body: "J'ai adoré les paupiettes de veau.", auteur_id: u2.id)
Comment.create(user_id: u2.id, body: "C'était délicieux merci beaucoup.", auteur_id: u.id)
Comment.create(user_id: u2.id, body: "Les lasagnes de légumes sont exquises!", auteur_id: u.id)
Comment.create(restaurant_id: r.id, body: "L'assaisonnement des plats est parfaites.", auteur_id: u.id)
Comment.create(restaurant_id: r.id, body: "C'est la première fois que je m'évanouie en mangeant.", auteur_id: u2.id)
