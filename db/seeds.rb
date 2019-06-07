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
addr = Address.all
activities_attributes = [
  {
    title: 'A melhor época do ano chegou: Organize um almoço de festa junina!',
    description: 'É hora de vestir xadrez, fazer trancinha, esquentar com vinho quente e dançar quadrilha!
                  Escolha a turma e faça o convite pro arraiá.
                  Cada um pode escolher algo pra providenciar, que vai ficar super fácil e divertido!

                  Aqui vai uma lista de ideias típicas:

                  Para beliscar:
                  - Amendoim
                  - Milho cozido
                  - Pamonha
                  - Pipoca

                  Para adocicar:
                  - Bolo de Churros
                  - Bolo de Milho
                  - Paçoca

                  Para beber:
                  - Quentão
                  - Vinho quente

                  Para decorar:
                  - Bandeirinhas
                  - Balões de papel
                  - Toalhas de mesa coloridas
                  - Chapéus de palha

                  Pra ouvir e dançar:
                  - Forró
                  - Sertanejo
                  - Quadrilha',
    event: false,
    group: true,
    confirmed: true,
    photo: 'festa_junina',
    owner: User.last,
    address: Address.first
  },
  {
    title: 'Capital financeiro: Importância para um envelhecimento ativo.',
    description: 'Palestra na Unibes Cultural com Prof. Dr. Hélio Zylberstajn, sênior da Faculdade de Economia, Administração e Contabilidade da USP',
    event: true,
    group: true,
    event_date: '29/08/2019 19:00',
    photo: 'finanças',
    capacity: 20,
    confirmed: true,
    owner: User.last,
    address: addr[1]
  },
  {
    title: 'Crie a sua receita de Naked Cake: o famoso ‘bolo pelado’!',
    description: 'Use a criatividade pra experimentar uma nova receita!
                  Escolha o sabor da massa, seus recheios preferidos, os complementos e arrase na decoração.
                  Faça aquela combinação que você sempre teve curiosidade de saber como ficaria e convide amigos e familiares para provar com você!',
    event: false,
    group: true,
    confirmed: true,
    photo: 'naked_cake',
    owner: User.last,
    address: Address.first
  },
  {
    title: 'Envelhecimento e Cuidados paliativos',
    description: 'Palestra na Unibes Cultural com Profa. Dra. Ana Beatriz Galhardi Di Tommaso. Médica especialista em geriatria pela SBGG e membro da comissão permanente de cuidados paliativos.',
    event: true,
    group: true,
    event_date: '18/09/2019 19:00',
    photo: 'caminhada',
    capacity: 50,
    confirmed: true,
    owner: User.last,
    address: addr[1]
  },
  {
    title: 'Chame os amigos para um piquenique!',
    description: 'Escolham um parque próximo de vocês e aproveitem!
                  Sugestão de lista de itens para levarem:
                  - Água
                  - Amendoim e castanhas
                  - Sanduíches
                  - Frutas
                  - Canga
                  - Copos e pratinhos
                  - Saco plástico para o lixo
                  - Baralho',
    event: false,
    group: true,
    confirmed: true,
    photo: 'piquenique',
    owner: User.last,
    address: Address.first

  },
  {
    title: 'Musicoterapia com Idosos: a experiência musical na prevenção e reabilitação',
    description: 'Seja bem vindo Congresso nacional de treinamento para grupos especiais. Temos como objetivo reunir 4 profissionais que decidiram se dedicar a este este perfil que tende a crescer cada vez mais (idosos), Personal Trainer de idosos é uma das principais tendências do mercado, mas poucos tem capacidade para tal! Este publico exige uma atenção redobrada, E por que deve investir neste nicho? Em 2030, estima-se que o Brasil terá aproximadamente ~ 33 milhões de idosos, o que leva o país a ocupar o 5º lugar no ranking mundial de população idosa. Porém, o mercado de profissionais de Educação Física nessa área é escasso. Tenha um público diferenciado, O que realmente pode fazer toda diferença em sua carreira profissional sendo capacitado a atender este público com maior responsabilidade.',
    event: true,
    group: true,
    event_date: '29/06/2019 09:00',
    photo: 'musicoterapia',
    capacity: 15,
    confirmed: true,
    owner: User.last,
    address: addr[2]
  },
]
Activity.create!(activities_attributes)
puts "Finished! #{Activity.count} activities created."
