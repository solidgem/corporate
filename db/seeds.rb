# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create_with(password: '123456', name: "Администратор", role: :administrator)
    .find_or_create_by!(email: 'admin@solidgem.ru')
User.create_with(password: '123456', name: "Пользователь менеджер", role: :manager)
    .find_or_create_by!(email: 'manager@solidgem.ru')
User.create_with(password: '123456',
                 name: "Пользователь исполнитель",
                 role: :worker,
                 hour_rate: 100,
                 external_hour_rate: 200)
    .find_or_create_by!(email: 'worker@solidgem.ru')

100.times do |i|
  User.create_with(password: '123456',
                 name: "Пользователь исполнитель #{i}",
                 role: :worker,
                 hour_rate: 100,
                 external_hour_rate: 200)
    .find_or_create_by!(email: "worker-#{i}@solidgem.ru")
end
