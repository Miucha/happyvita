# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Booking.destroy_all
ActivityInterest.destroy_all
UserInterest.destroy_all
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
    birth_date: '05/12/1948',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560282814/maria_cx5zdv.jpg'
  },
  {
    email: 'joao@joao.com',
    password: 'joao123',
    first_name: 'João',
    last_name: 'Oliveira',
    birth_date: '08/04/1954',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560282813/jo%C3%A3o_jadwxh.jpg'
  },
  {
    email: 'odete@odete.com',
    password: 'odete123',
    first_name: 'Odete',
    last_name: 'Silveira',
    birth_date: '20/10/1956',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560282814/odete_l1v2jg.png'
  },
  {
    email: 'sonia@sonia.com',
    password: 'sonia123',
    first_name: 'Sônia',
    last_name: 'Barton',
    birth_date: '22/06/1953',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560434411/sonia_s0re3b.jpg'
  },
  {
    email: 'rita@rita.com',
    password: 'rita123',
    first_name: 'Rita',
    last_name: 'de Cássia',
    birth_date: '30/06/1951',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560435658/rita_jzdgsh.jpg'
  },
  {
    email: 'luizsalge@hotmail.com',
    password: 'luiz123',
    first_name: 'Luiz',
    last_name: 'Mendes',
    birth_date: '13/12/1952',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560452373/luiz_s9ntjt.jpg'
  },
  {
    email: 'clesia.tts@gmail.com',
    password: 'clesia123',
    first_name: 'Clésia',
    last_name: 'Mendes',
    birth_date: '27/04/1953',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560452373/cl%C3%A9sia_zwftox.jpg'
  }
]
User.create!(users_attributes)
puts "Finished! #{User.count} users created."

all_users = User.all

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
    user_id: all_users[3].id
  },
  {
    street: 'Rua Catalão',
    number: 72,
    suite: 'Centro de Musicoterapia Benenzon Brasil',
    district: 'Sumaré',
    city: 'São Paulo',
    state: 'SP',
    zipcode: '01255-020',
    user_id: all_users[2].id
  },
  {
    street: 'Av. Henrique Chamma',
    number: 420,
    district: 'Pinheiros',
    city: 'São Paulo',
    state: 'SP',
    zipcode: '04533-130',
    user_id: all_users[5].id
  },
  {
    street: 'Rua Harmonia',
    number: 28,
    district: 'Vila Madalena',
    city: 'São Paulo',
    state: 'SP',
    zipcode: '05435-000',
    user_id: all_users[7].id
  },
  {
    street: 'Rod. Dep. Archimedes Lammoglia',
    number: 18,
    suite: 'Km 18',
    city: 'Itu',
    state: 'SP',
    zipcode: '13300-000',
    user_id: all_users[2].id
  }
]

Address.create!(addresses_attributes)
puts "Finished! #{Address.count} addresses created."

puts 'Creating interests...'
interests_attributes = [
  { name: 'Alfaiataria'},
  { name: 'Artesato'},
  { name: 'Atividades físicas'},
  { name: 'Culinária'},
  { name: 'Cultura'},
  { name: 'Cursos'},
  { name: 'Danças'},
  { name: 'Esportes'},
  { name: 'História'},
  { name: 'Festas'},
  { name: 'Filmes'},
  { name: 'Finanças'},
  { name: 'Música'},
  { name: 'Novelas'},
  { name: 'Pesca'},
  { name: 'Saúde'},
  { name: 'Shows'},
  { name: 'Teatro'},
  { name: 'Turismo'},
]

Interest.create!(interests_attributes)
puts "Finished! #{Interest.count} interests created."

all_interests = Interest.all

puts 'Creating User interests...'

user_interests_attributes = [
  {
    interest_id: all_interests[0].id,
    user_id: all_users[1].id
  },
  {
    interest_id: all_interests[1].id,
    user_id: all_users[1].id
  },
  {
    interest_id: all_interests[3].id,
    user_id: all_users[1].id
  },
  {
    interest_id: all_interests[13].id,
    user_id: all_users[1].id
  },
  {
    interest_id: all_interests[2].id,
    user_id: all_users[2].id
  },
  {
    interest_id: all_interests[4].id,
    user_id: all_users[2].id
  },
  {
    interest_id: all_interests[7].id,
    user_id: all_users[2].id
  },
  {
    interest_id: all_interests[11].id,
    user_id: all_users[2].id
  },
  {
    interest_id: all_interests[14].id,
    user_id: all_users[2].id
  },
  {
    interest_id: all_interests[2].id,
    user_id: all_users[3].id
  },
  {
    interest_id: all_interests[6].id,
    user_id: all_users[3].id
  },
  {
    interest_id: all_interests[9].id,
    user_id: all_users[3].id
  },
  {
    interest_id: all_interests[12].id,
    user_id: all_users[3].id
  },
  {
    interest_id: all_interests[12].id,
    user_id: all_users[3].id
  },
  {
    interest_id: Interest.where(name: 'Saúde').first.id,
    user_id: all_users[7].id
  },
  {
    interest_id: Interest.where(name: 'Culinária').first.id,
    user_id: all_users[7].id
  },
  {
    interest_id: Interest.where(name: 'Atividades físicas').first.id,
    user_id: all_users[7].id
  },
  {
    interest_id: Interest.where(name: 'Esportes').first.id,
    user_id: all_users[6].id
  },
  {
    interest_id: Interest.where(name: 'Pesca').first.id,
    user_id: all_users[6].id
  },
  {
    interest_id: Interest.where(name: 'História').first.id,
    user_id: all_users[6].id
  },
  {
    interest_id: Interest.where(name: 'Música').first.id,
    user_id: all_users[6].id
  }
]

UserInterest.create!(user_interests_attributes)
puts "Finished! #{UserInterest.count} users interests created."

puts 'Creating activities...'

all_addresses = Address.all
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
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919109/festa_junina.jpg',
    owner: all_users[1],
    address: Address.first
  },
  {
    title: 'Capital financeiro: Importância para um envelhecimento ativo.',
    description: 'Palestra na Unibes Cultural com Prof. Dr. Hélio Zylberstajn, sênior da Faculdade de Economia, Administração e Contabilidade da USP',
    event: true,
    group: true,
    event_date: '29/08/2019 19:00',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559920943/finan%C3%A7as.jpg',
    capacity: 20,
    confirmed: true,
    owner: all_users[3],
    address: all_addresses[1]
  },
  {
    title: 'Crie a sua receita de Naked Cake: o famoso ‘bolo pelado’!',
    description: 'Use a criatividade pra experimentar uma nova receita!
                  Escolha o sabor da massa, seus recheios preferidos, os complementos e arrase na decoração.
                  Faça aquela combinação que você sempre teve curiosidade de saber como ficaria e convide amigos e familiares para provar com você!',
    event: false,
    group: true,
    confirmed: true,
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560433295/naked_cake_post_ajcdgi.jpg',
    owner: all_users[1],
    address: Address.first
  },
  {
    title: 'Envelhecimento e Cuidados paliativos',
    description: 'Palestra na Unibes Cultural com Profa. Dra. Ana Beatriz Galhardi Di Tommaso. Médica especialista em geriatria pela SBGG e membro da comissão permanente de cuidados paliativos.',
    event: true,
    group: true,
    event_date: '18/09/2019 19:00',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919166/caminhada.jpg',
    capacity: 50,
    confirmed: true,
    owner: all_users[3],
    address: all_addresses[1]
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
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919469/piquenique.jpg',
    owner: all_users[3],
    address: Address.first

  },
  {
    title: 'Musicoterapia com Idosos: a experiência musical na prevenção e reabilitação',
    description: 'Serão abordados temas relacionados ao idoso, ao envelhecimento, à musicoterapia e à música como recurso no contexto preventivo e de reabilitação. Alguns tópicos:

                - considerações sobre o envelhecimento ativo
                - re-pensando quem é o sujeito do envelhecimento
                - identidade sonora do idoso: corpo e memórias
                - música e memória autobiográfica
                - oficinas musicoterapêuticas
                - experiências musicais com o idoso nos diferentes contextos
                - recreação musical X estimulação cognitiva X musicoterapia',
    event: true,
    group: true,
    event_date: '29/06/2019 09:00',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919064/musicoterapia.jpg',
    capacity: 15,
    confirmed: true,
    owner: all_users[2],
    address: all_addresses[2]
  },
  {
    title: 'Yoga no Parque do Povo',
    description: 'Faço yoga há 2 anos e faz muito bem para mim.
                  Dei a ideia para a minha professora de yoga de realizarmos um aulão gratuito no Parque Ibirapuera e ela gostou.
                  Aproveite essa oportunidade! Ela é muito boa!',
    event: true,
    group: true,
    event_date: '16/06/2019 08:30',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919297/yoga.jpg',
    capacity: 40,
    confirmed: true,
    owner: all_users[5],
    address: all_addresses[3]
  },
  {
    title: 'Coral R2 no Beco do Batman',
    description: 'Eu participo do coral R2 e faremos uma apresentação aberta ao público no sábado, dia 22 de junho.
                  O meu marido participa comigo e nos divertimos bastante com o pessoal.
                  Será no Beco do Batman. Venha conhecer!
                  O nosso professor é ótimo e poderá abrir novas turmas.',
    event: true,
    group: true,
    event_date: '22/06/2019 16:00',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1559919306/coral.jpg',
    capacity: 40,
    confirmed: true,
    owner: all_users[7],
    address: all_addresses[4]
  },
  {
    title: 'Um domingo no pesqueiro Maeda',
    description: 'O pesqueiro Maeda fica em Itu (São Paulo) e é um dos pesqueiros mais populares de todo o Brasil.
                  Sairemos de São Paulo em uma van para até 12 pessoas, mas você pode ir direto também se preferir!',
    event: true,
    group: true,
    event_date: '23/06/2019 08:00',
    remote_photo_url: 'https://res.cloudinary.com/lewagon-256/image/upload/v1560441164/pesca_wmo7bq.jpg',
    capacity: 12,
    confirmed: true,
    owner: all_users[2],
    address: all_addresses[4]
  }
]
Activity.create!(activities_attributes)
puts "Finished! #{Activity.count} activities created."

all_activities = Activity.all

puts 'Creating Activity interests...'

activity_interests_attributes = [
  {
    interest_id: Interest.where(name: 'Festas').first.id,
    activity_id: all_activities[0].id
  },
  {
    interest_id: Interest.where(name: 'Culinária').first.id,
    activity_id: all_activities[0].id
  },
  {
    interest_id: Interest.where(name: 'Danças').first.id,
    activity_id: all_activities[0].id
  },
  {
    interest_id: Interest.where(name: 'Finanças').first.id,
    activity_id: all_activities[1].id
  },
  {
    interest_id: Interest.where(name: 'Culinária').first.id,
    activity_id: all_activities[2].id
  },
  {
    interest_id: Interest.where(name: 'Saúde').first.id,
    activity_id: all_activities[3].id
  },
  {
    interest_id: Interest.where(name: 'Atividades físicas').first.id,
    activity_id: all_activities[3].id
  },
  {
    interest_id: Interest.where(name: 'Festas').first.id,
    activity_id: all_activities[4].id
  },
  {
    interest_id: Interest.where(name: 'Música').first.id,
    activity_id: all_activities[5].id
  },
  {
    interest_id: Interest.where(name: 'Esportes').first.id,
    activity_id: all_activities[6].id
  },
  {
    interest_id: Interest.where(name: 'Saúde').first.id,
    activity_id: all_activities[6].id
  },
  {
    interest_id: Interest.where(name: 'Atividades físicas').first.id,
    activity_id: all_activities[6].id
  },
  {
    interest_id: Interest.where(name: 'Música').first.id,
    activity_id: all_activities[7].id
  },
  {
    interest_id: Interest.where(name: 'Pesca').first.id,
    activity_id: all_activities[8].id
  },
]

ActivityInterest.create!(activity_interests_attributes)
puts "Finished! #{ActivityInterest.count} activities interests created."

puts 'Creating Bookings...'

bookings_attributes = [
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[2].id,
    user_id: all_users[1].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560439713/cake_review7_jko1d9.jpg",
    review_rate: 10,
    review_comment: "Adorei a experiência de usar ingredientes e frutas que eu nunca tinha misturado antes!"
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[2].id,
    user_id: all_users[4].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560435349/cake_review8_sll3js.jpg",
    review_rate: 10,
    review_comment: "Amei! Ficou bem gostoso. Misturei massa de chocolate e recheio de maracujá. Experimentem!"
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[2].id,
    user_id: all_users[3].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560378854/cake_review3_tz83vj.jpg",
    review_rate: 9,
    review_comment: "Meu neto que pediu para fazer de bolacha. Achei muito doce, mas ele ficou muito feliz!"
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[2].id,
    user_id: all_users[5].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560378854/cake_review_xli3ee.jpg",
    review_rate: 10,
    review_comment: "Uma delícia! Minha família gosta muito de churros e eles amaram!"
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[0].id,
    user_id: all_users[5].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560436022/festa_junina_review2_gil6be.jpg",
    review_rate: 10,
    review_comment: "Que festa boa! Convidei amigos e cada um levou algo. Foi uma delícia!"
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[0].id,
    user_id: all_users[4].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560436022/festa_junina_review3_mgxqeu.jpg",
    review_rate: 9,
    review_comment: "Deu trabalho, mas amei! Fiz lá em casa com a família e no fim foi muito divertido."
  },
  {
    done: true,
    schedule_date: '13/06/2019',
    activity_id: all_activities[0].id,
    user_id: all_users[1].id,
    remote_review_photo_url: "https://res.cloudinary.com/lewagon-256/image/upload/v1560436508/festa_junina_review1_wn8vtc.jpg",
    review_rate: 10,
    review_comment: "Amei! Eu adoro cozinhar e tenho uma amiga que ama decorar. Nossos amigos elogiaram muito!"
  }
]

Booking.create!(bookings_attributes)
puts "Finished! #{Booking.count} activities interests created."
