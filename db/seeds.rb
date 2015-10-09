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

ServiceKind.create_with(name: 'разработка сайта').find_or_create_by!(code: 'DEV')
ServiceKind.create_with(name: 'сопровождение сайта').find_or_create_by!(code: 'SUP')
ServiceKind.create_with(name: 'субподрядные работы').find_or_create_by!(code: 'A/DEV')
ServiceKind.create_with(name: 'контекстная реклама').find_or_create_by!(code: 'CON')
ServiceKind.create_with(name: 'SMM-продвижение').find_or_create_by!(code: 'SMM')
ServiceKind.create_with(name: 'SEO-продвижение').find_or_create_by!(code: 'SEO')