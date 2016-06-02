# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

planeamiento = Sector.create! name: 'Planeamiento', latitude: -34.629319, longitude: -58.379546
rrhh         = Sector.create! name: 'RRHH',         latitude: -34.628114, longitude: -58.381069
gerencia     = Sector.create! name: 'Gerencia',     latitude: -34.627990, longitude: -58.380227

Sector.find_each do |sector|
  rand(10..25).times do
    extinguisher = sector.extinguishers.create! kind: Extinguisher::KINDS.sample, expiration_at: rand(1.day.from_now..2.months.from_now)
    puts "#{extinguisher.kind} at #{sector.name}"
  end
end
