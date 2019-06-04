# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Address.destroy_all
Activity.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    email: 'maria@maria.com',
    password: 'maria123',
    first_name: 'Maria',
    last_name: 'da Silva',
    birth_date: '05/12/1950'
  },
  {
    email: 'joao@joao.com',
    password: 'joao123',
    first_name: 'João',
    last_name: 'Oliveira',
    birth_date: '08/04/1954'
  },
  {
    email: 'odete@odete.com',
    password: 'odete123',
    first_name: 'Odete',
    last_name: 'Silveira',
    birth_date: '20/10/1948'
  },
]
User.create!(users_attributes)
puts "Finished! #{User.count} users created."

puts 'Creating addresses...'
addresses_attributes = [
  {
    street: 'Rua Oscar Freire',
    number: 2500,
    suite: '',
    district: 'Sumaré',
    city: 'São Paulo',
    state: 'SP'
    zipcode: '05409-12',
    id_users: 1,
    id_address: 1
  },
]
Address.create!(addresses_attributes)
puts "Finished! #{Address.count} addresses created."

puts 'Creating activities...'
activities_attributes = [
  {
    title: 'Capital financeiro: Importância para um envelhecimento ativo.',
    description: 'Palestra na Unibes Cultural com Prof. Dr. Hélio Zylberstajn, sênior da Faculdade de Economia, Administração e Contabilidade da USP',
    event: true,
    group: true,
    event_date: '29/08/2019 19:00'
    photo: 'http://osepeense.com/wp-content/uploads/2015/09/1idosos-shutterstock_23529820-300x252.jpg'
    capacity: 50,
    confirmed: true,
    user_id: 1,
    address_id: 1
  },
  {
    title: 'Envelhecimento e Cuidados paliativos',
    description: 'Palestra na Unibes Cultural com Profa. Dra. Ana Beatriz Galhardi Di Tommaso. Médica especialista em geriatria pela SBGG e membro da comissão permanente de cuidados paliativos.',
    event: true,
    group: true,
    event_date: '18/09/2019 19:00'
    photo: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/12/59039135_m-810x537.jpg'
    capacity: 50,
    confirmed: true,
    user_id: 1,
    address_id: 1
  },
]
Activity.create!(activities_attributes)
puts "Finished! #{Activity.count} activities created."
