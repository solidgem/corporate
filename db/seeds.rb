# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

administrator =
    User.create_with(password: '123456', name: "Администратор", role: :administrator)
        .find_or_create_by!(email: 'admin@solidgem.ru')

manager =
    User.create_with(password: '123456', name: "Другой Пользователь менеджер", role: :manager)
        .find_or_create_by!(email: 'another_manager@solidgem.ru')

another_manager =
    User.create_with(password: '123456', name: "Пользователь менеджер", role: :manager)
        .find_or_create_by!(email: 'manager@solidgem.ru')

user =
    User.create_with(password: '123456', name: "Пользователь исполнитель", role: :worker,
                     hour_rate: 100, external_hour_rate: 200)
         .find_or_create_by!(email: 'worker@solidgem.ru')

counterparty =
    Counterparty.create_with(requisites: 'Реквизиты', contacts: 'Контакты',
                             site: 'http://google.com', comment: 'Комментарий',
                             responsible_user: manager)
                .find_or_create_by!(title: 'Контрагент 1')
another_counterparty =
    Counterparty.create_with(requisites: 'Реквизиты', contacts: 'Контакты',
                             site: 'http://google.com', comment: 'Комментарий',
                             responsible_user: manager)
                .find_or_create_by!(title: 'Контрагент 2')

counterparty.officials.create_with(position: 'Директор', contacts: 'Тел: 777777')
                       .find_or_create_by!(full_name: 'Иванов Иван Иванович')

counterparty.officials.create_with(position: 'Уборщица', contacts: 'Тел: 777777')
                      .find_or_create_by!(full_name: 'Петров Петр Петрович',)

project =
    Project.create_with(cost: '10000', responsible_user: manager,
                        counterparty: counterparty, deadline: 1.day.since)
           .find_or_create_by!(title: 'Проект 1')

another_project =
    Project.create_with(cost: '10000', responsible_user: manager,
                        counterparty: another_counterparty, deadline:  1.day.ago)
           .find_or_create_by!(title: 'Проект 2')

task =
    project.tasks.create_with(description: 'Описание задачи', creator: manager,
                                 responsible_user: manager, deadline: 1.day.since,
                                 competence: 'programming', access_data: 'Доступы 1')
                 .find_or_create_by!(title: 'Задача 1')

another_task =
    project.tasks.create_with(description: 'Описание задачи', creator: another_manager,
                              responsible_user: another_manager, deadline: 1.day.ago,
                              competence: 'html_coding', access_data: 'Доступы 2')
                 .find_or_create_by!(title: 'Задача 2')

task.comments.create_with(elapsed_time: 10.hours, user: user)
             .find_or_create_by!(content: 'Первый комментарий к задаче 1')

task.comments.create_with(elapsed_time: 10.hours, user: user)
             .find_or_create_by!(content: 'Третий комментарий к задаче 1')

another_task.comments.create_with(elapsed_time: 10.hours, user: user)
                     .find_or_create_by!(content: 'Первый комментарий к задаче 2')

another_task.comments.create_with(elapsed_time: 44.minutes, user: manager)
                     .find_or_create_by!(content: 'Второй комментарий к задаче 2')
