# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Booking.destroy_all
Activity.destroy_all
Interest.destroy_all
Address.destroy_all
User.destroy_all


puts 'Creating users...'
users_attributes = [
  {
    email: 'address@local',
    password: 'youmutnotusethisuserfornothingtakeyourhandsout',
  },
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
first = User.first
last = User.last
addresses_attributes = [
  {
    user: User.first
  },
  {
    street: 'Rua Oscar Freire',
    number: 2500,
    suite: 'Unibes Cultural',
    district: 'Sumaré',
    city: 'São Paulo',
    state: 'SP',
    zipcode: '05409-012',
    user: last
  },
  {
    street: 'Rua Catalão',
    number: 72,
    suite: 'Centro de Musicoterapia Benenzon Brasil',
    district: 'Sumaré',
    city: 'São Paulo',
    state: 'SP',
    zipcode: '01255-020',
    user: last
  }
]
Address.create!(addresses_attributes)
puts "Finished! #{Address.count} addresses created."

puts 'Creating interests...'
interests_attributes = [ { name: 'Caminhada'}, { name: 'Culinária'}, { name: 'Cursos'}, { name: 'Dança'}, { name: 'Esporte'}, { name: 'História'}, { name: 'Finanças'}, { name: 'Música'}, { name: 'Saúde'}, { name: 'Show'}, { name: 'Teatro'}, { name: 'Yoga'} ]

Interest.create!(interests_attributes)
puts "Finished! #{Interest.count} interests created."

puts 'Creating activities...'
activities_attributes = [
  {
    title: 'Capital financeiro: Importância para um envelhecimento ativo.',
    description: 'Palestra na Unibes Cultural com Prof. Dr. Hélio Zylberstajn, sênior da Faculdade de Economia, Administração e Contabilidade da USP',
    event: true,
    group: true,
    event_date: '29/08/2019 19:00',
    photo: 'http://osepeense.com/wp-content/uploads/2015/09/1idosos-shutterstock_23529820-300x252.jpg',
    capacity: 20,
    confirmed: true,
    owner: User.last,
    address: Address.first
  },
  {
    title: 'Envelhecimento e Cuidados paliativos',
    description: 'Palestra na Unibes Cultural com Profa. Dra. Ana Beatriz Galhardi Di Tommaso. Médica especialista em geriatria pela SBGG e membro da comissão permanente de cuidados paliativos.',
    event: true,
    group: true,
    event_date: '18/09/2019 19:00',
    photo: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/12/59039135_m-810x537.jpg',
    capacity: 50,
    confirmed: true,
    owner: User.last,
    address: Address.first
  },
  {
    title: 'Musicoterapia com Idosos: a experiência musical na prevenção e reabilitação',
    description: 'Seja bem vindo Congresso nacional de treinamento para grupos especiais. Temos como objetivo reunir 4 profissionais que decidiram se dedicar a este este perfil que tende a crescer cada vez mais (idosos), Personal Trainer de idosos é uma das principais tendências do mercado, mas poucos tem capacidade para tal! Este publico exige uma atenção redobrada, E por que deve investir neste nicho? Em 2030, estima-se que o Brasil terá aproximadamente ~ 33 milhões de idosos, o que leva o país a ocupar o 5º lugar no ranking mundial de população idosa. Porém, o mercado de profissionais de Educação Física nessa área é escasso. Tenha um público diferenciado, O que realmente pode fazer toda diferença em sua carreira profissional sendo capacitado a atender este público com maior responsabilidade.',
    event: true,
    group: true,
    event_date: '29/06/2019 09:00',
    photo: 'https://static.wixstatic.com/media/7d2c22_5275a20ca5c3446cbdc330bd9d364c0b~mv2.jpg/v1/fill/w_630,h_294,al_c,lg_1,q_80/7d2c22_5275a20ca5c3446cbdc330bd9d364c0b~mv2.jpg',
    capacity: 15,
    confirmed: true,
    owner: User.last,
    address: Address.last
  },
]
Activity.create!(activities_attributes)
puts "Finished! #{Activity.count} activities created."
