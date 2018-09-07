# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PaniersPlat.destroy_all
Plat.destroy_all
if User.find_by(email: "test@example.com")
  example = User.find_by(email: "test@example.com").id
  Order.destroy(Order.find_by(user_id: example).id)
  Panier.destroy(Panier.find_by(user_id: example).id)
  User.destroy(example)
end
u = User.create(prénom: "Crash", nom: "Test", ville: "Nantes", téléphone: "0606060606", email: "test@example.com", password: "foobar", password_confirmation: "foobar")
pan = Panier.create(user_id: u.id)
4.times do |i|

  plat = Plat.create(user_id: u.id, titre: "plat#{i}", description: "voilà mon plat", prix: 9, stock: 1, plage_horaire: "8h-20h", image_url: "plat#{i}")
  PaniersPlat.create(panier_id: pan.id, plat_id: plat.id, quantité: 1)
  i += 1;

end
Order.create(user_id: u.id, panier_id: pan.id)
