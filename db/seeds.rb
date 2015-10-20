# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dir.glob(Rails.root + '/app/models/**/*.rb').each { |file| require file }
ActiveRecord::Base.subclasses.each { |model| model.reset_column_information }

administrator =
    User
        .create_with(
            password: '123456',
            name: "Администратор",
            role: :administrator)
        .find_or_create_by!(email: 'admin@solidgem.ru')

manager =
    User
        .create_with(
            password: '123456',
            name: "Другой пользователь Менеджер",
            role: :manager)
        .find_or_create_by!(email: 'another_manager@solidgem.ru')

another_manager =
    User
        .create_with(
            password: '123456',
            name: "Пользователь менеджер",
            role: :manager)
        .find_or_create_by!(email: 'manager@solidgem.ru')

worker =
    User
        .create_with(
            password: '123456',
            name: "Пользователь исполнитель",
            role: :worker,
            hour_rate: 100,
            external_hour_rate: 200)
        .find_or_create_by!(email: 'worker@solidgem.ru')

counterparty =
    Counterparty
        .create_with(
            requisites:
                %q{КБ «Ренессанс Кредит» (ООО) г. Москва Корр. счет №999999999
                   в Отделении 3 Главного управления Центрального банка Российской
                   Федерации по Центральному федеральному округу г. Москва
                   (сокращенное наименование - Отделение 3 Москва) БИК 888888,
                   ИНН 111111111, КПП 222222222}.strip_heredoc,
            contacts:
                %q{ПАО Ренессанс Кредит. Россия, Ульяновск, 117997, ул. Вавилова, д. 19
                   тел. +7 (495) 500 5550, 8 800 555 5550.}.strip_heredoc,
            site: 'http://google.com',
            comment:
                 %q{В сегодняшнем Сбербанке почти ничего не напоминает о сберегательных кассах,
                    функции которых он выполнял на протяжении значительного периода своей истории.
                    Но удивительно другое: Сбербанк уже мало похож даже на самого себя всего лишь
                    десятилетней давности!}.strip_heredoc,
            responsible_user: manager)
        .find_or_create_by!(title: 'Ренессанс')


another_counterparty =
    Counterparty
        .create_with(
            requisites:
                %q{КБ «СБЕРБАНК» (ООО) г. Москва Корр. счет №0001010101
                   в Отделении 99 Главного управления Центрального банка Российской
                   Федерации по Центральному федеральному округу г. Москва
                   (сокращенное наименование - Отделение 3 Москва) БИК 888888,
                   ИНН 111111111, КПП 222222222}.strip_heredoc,
            contacts:
                %q{ПАО Сбербанк. Россия, Москва, 117997, ул. Вавилова, д. 19,
                   тел. +7 (495) 500 5550, 8 800 555 5550.}.strip_heredoc,
            site: 'http://google.com',
            comment:
                %q{Способность к переменам и движению вперед — признак отличной «спортивной» формы,
                   в которой находится сегодня Сбербанк. Титул старейшего и крупнейшего банка России
                   не мешает ему открыто и добросовестно конкурировать на банковском рынке и держать
                   руку на пульсе финансовых и технологических перемен. Сбербанк не только шагает в
                   ногу с современными тенденциями рынка, но и опережает их, уверенно ориентируясь в
                   стремительно меняющихся технологиях и предпочтениях клиентов.}.strip_heredoc,
            responsible_user: manager)
        .find_or_create_by!(title: 'Сбербанк')

counterparty.officials.create_with(position: 'Директор', contacts: 'Тел: 777777')
                       .find_or_create_by!(full_name: 'Иванов Иван Иванович')

counterparty.officials.create_with(position: 'Уборщица', contacts: 'Тел: 111111')
                      .find_or_create_by!(full_name: 'Петров Петр Петрович')

project =
    Project.create_with(cost: '10000', responsible_user: manager,
                        counterparty: counterparty, deadline: 1.day.since,
                        status_event: 'finish', finished_at: DateTime.current)
           .find_or_create_by!(title: 'CRM')

another_project =
    Project.create_with(cost: '999999', responsible_user: manager,
                        counterparty: another_counterparty, deadline:  1.day.ago)
           .find_or_create_by!(title: 'ERP')

task =
    project
        .tasks
        .create_with(
            description:
                %q{Сбербанк сегодня — это кровеносная система российской экономики,
                   треть ее банковской системы. Банк дает работу и источник дохода
                   каждой 150-й российской семье.}.strip_heredoc,
            creator: manager,
            responsible_user: manager,
            deadline: 1.day.since,
            competence: 'programming',
            access_data: 'пароль: pass')
        .find_or_create_by!(title: 'Собрать требования')

another_task =
    project
        .tasks
        .create_with(
            description:
                %q{На долю лидера российского банковского сектора по общему
                   объему активов приходится 29,4% совокупных банковских активов
                   (по состоянию на 1 августа 2014 года).}.strip_heredoc,
            creator: another_manager,
            responsible_user: another_manager,
            deadline: 1.day.ago,
            competence: 'html_coding',
            access_data: 'пароль: пароль')
        .find_or_create_by!(title: 'Разработать')

task
    .comments
    .create_with(elapsed_time: 10.hours, user: worker)
    .find_or_create_by!(content: 'Первый комментарий к задаче 1')

task
    .comments
    .create_with(elapsed_time: 10.hours, user: worker)
    .find_or_create_by!(content: 'Третий комментарий к задаче 1')

another_task
    .comments
    .create_with(elapsed_time: 10.hours, user: worker)
    .find_or_create_by!(content: 'Первый комментарий к задаче 2')

another_task
    .comments
    .create_with(elapsed_time: 44.minutes, user: manager)
    .find_or_create_by!(content: 'Второй комментарий к задаче 2')

ServiceKind
    .create_with(name: 'разработка сайта')
    .find_or_create_by!(code: 'DEV')

ServiceKind
    .create_with(name: 'сопровождение сайта')
    .find_or_create_by!(code: 'SUP')

ServiceKind
    .create_with(name: 'субподрядные работы')
    .find_or_create_by!(code: 'A/DEV')

ServiceKind
    .create_with(name: 'контекстная реклама')
    .find_or_create_by!(code: 'CON')

smm_service_kind =
    ServiceKind
        .create_with(name: 'SMM-продвижение')
        .find_or_create_by!(code: 'SMM')

seo_service_kind =
    ServiceKind
        .create_with(name: 'SEO-продвижение')
        .find_or_create_by!(code: 'SEO')

contract =
    Contract
        .create_with(
            service_kind: smm_service_kind,
            date: 30.day.ago,
            counterparty: counterparty,
            contact_person: manager,
            have_original: true)
        .find_or_create_by!(order_number: 1)

another_contract =
    Contract
        .create_with(
            service_kind: seo_service_kind,
            date: 55.day.ago,
            counterparty: another_counterparty,
            contact_person: another_manager,
            have_original: false)
        .find_or_create_by!(order_number: 2)

contact_appendix =
    Contract::Appendix
        .create_with(
            date: 15.day.ago,
            contract: contract,
            contact_person: manager,
            have_original: true)
        .find_or_create_by!(order_number: 1)

another_contact_appendix =
    Contract::Appendix
        .create_with(
            date: 5.day.ago,
            contract: contract,
            contact_person: another_manager,
            have_original: false)
        .find_or_create_by!(order_number: 2)

contact_supplementary_agreement =
    Contract::SupplementaryAgreement
        .create_with(
            date: 5.day.ago,
            contract: contract,
            contact_person: manager,
            have_original: false)
        .find_or_create_by!(order_number: 1)

another_contact_supplementary_agreement =
    Contract::SupplementaryAgreement
        .create_with(
            date: 1.day.ago,
            contract: contract,
            contact_person: another_manager,
            have_original: true)
        .find_or_create_by!(order_number: 2)

contract
    .acts
    .create_with(
        date: 33.days.ago,
        formulation: 'Акт — это документ, составляемый группой лиц',
        sum: 12345)
    .find_or_create_by!(order_number: 1)

contact_supplementary_agreement
    .acts
    .create_with(
        date: 10.days.ago,
        formulation: 'Акт — это документ, составляемый группой лиц',
        sum: 10045)
    .find_or_create_by!(order_number: 1)
