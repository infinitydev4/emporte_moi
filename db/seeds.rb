# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plat.destroy_all

4.times do |i|

  Plat.create(user_id: 1, titre: "plat#{i}", description: "voilà mon plat", prix: 9, stock: 1, plage_horaire: "8h-20h", image_url: "plat#{i}")
  i += 1;

end
