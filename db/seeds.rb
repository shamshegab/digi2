# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if UserRole.all.empty?
    UserRole.create(title:"Super Admin")
end

if User.all.empty?
    user = User.new
    user.name="Shams Hegab"
    user.email = "shamsheg@gmail.com "
    user.password = "laksjdhf1"
    user.password_confirmation = "laksjdhf1"
    user.role=UserRole.find_by(title: "Super Admin")
    user.label = :admin
    user.save!
end