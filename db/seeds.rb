require "open-uri"
Order.destroy_all
Service.destroy_all
User.destroy_all
Category.destroy_all

# Crear usuarios
users = User.create!([
  { email: 'juan@example.com', password: 'password', first_name: 'Juan', last_name: 'Perez', address: 'Lima' },
  { email: 'maria@example.com', password: 'password', first_name: 'Maria', last_name: 'Gomez', address: 'Arequipa' },
  { email: 'carlos@example.com', password: 'password', first_name: 'Carlos', last_name: 'Garcia', address: 'Cusco' },
  { email: 'ana@example.com', password: 'password', first_name: 'Ana', last_name: 'Lopez', address: 'Trujillo' },
  { email: 'luis@example.com', password: 'password', first_name: 'Luis', last_name: 'Martinez', address: 'Piura' },
  { email: 'claudia@example.com', password: 'password', first_name: 'Claudia', last_name: 'Ramirez', address: 'Iquitos' },
  { email: 'victorhuatucov@gmail.com', password: '123456', first_name: 'Victor', last_name: 'Huatuco', address: 'Lima' },
  { email: 'pamelamc23@gmail.com', password: '123456', first_name: 'Pamea', last_name: 'Matias', address: 'Lima' },
  { email: 'gslazar96@gmail.com', password: '123456', first_name: 'Gustavo', last_name: 'Salazar', address: 'Lima' },
  { email: 'enrique7stolar@gmail.com', password: '123456', first_name: 'Enrique', last_name: 'Stolar', address: 'Lima'}
])

puts "Usuarios creados: #{users.inspect}"

# Crear categorías
categories = Category.create!([
  { category: 'Parrilla' },
  { category: 'Comida Peruana' },
  { category: 'Buffet' },
  { category: 'Comida Italiana' },
  { category: 'Comida China' },
  { category: 'Comida Mexicana' }
])

puts "Categorías creadas: #{categories.inspect}"

# Crear servicios
services = Service.create!([
  { name: 'Parrillada en Casa', description: 'Deliciosa parrillada a domicilio con carne de primera', cost: 150.00, category: Category.find_by(category: 'Parrilla'), user: users[0] },
  { name: 'Buffet Criollo', description: 'Comida criolla para eventos especiales con familia o amigos', cost: 250.00, category: Category.find_by(category: 'Comida Peruana'), user: users[1] },
  { name: 'Pizza Italiana', description: 'Pizza hecha en horno de leña con ingredientes frescos', cost: 100.00, category: Category.find_by(category: 'Comida Italiana'), user: users[2] },
  { name: 'Comida China Gourmet', description: 'Exquisitos platillos chinos para tus eventos familiares', cost: 200.00, category: Category.find_by(category: 'Comida China'), user: users[0] },
  { name: 'Tacos Mexicanos', description: 'Auténticos tacos mexicanos con los mejores ingredientes', cost: 180.00, category: Category.find_by(category: 'Comida Mexicana'), user: users[3] }
])

# Adjuntar varias imágenes
images_service1 = [
  { url: "https://tofuu.getjusto.com/orioneat-prod/4kkQK8cfvu3wrkJA2-Parrilla%20Especial.jpg", filename: "nes1.png" },
  { url: "https://tofuu.getjusto.com/orioneat-prod/4kkQK8cfvu3wrkJA2-Parrilla%20Especial.jpg", filename: "nes2.png" }
]

images_service1.each do |image|
  file = URI.open("https://tofuu.getjusto.com/orioneat-prod/4kkQK8cfvu3wrkJA2-Parrilla%20Especial.jpg")
  services[0].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service2 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service2.each do |image|
  file = URI.open("https://static.wixstatic.com/media/7b69fa_f75a4c6c168244aba72cc078ca50f129~mv2.jpg/v1/fill/w_520,h_312,al_c,lg_1,q_80,enc_auto/7b69fa_f75a4c6c168244aba72cc078ca50f129~mv2.jpg")
  services[1].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service3 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service3.each do |image|
  file = URI.open("https://s7g10.scene7.com/is/image/barcelo/mejores%20pizzas%20italia")
  services[2].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service4 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service4.each do |image|
  file = URI.open("https://www.cocinacaserayfacil.net/wp-content/uploads/2019/11/Comida-china.jpg")
  services[3].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service5 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service5.each do |image|
  file = URI.open("https://encolombia.com/wp-content/uploads/2019/07/Comida-Mexicana-y-Tex-mex.jpg")
  services[4].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

puts "Servicios creados: #{services.inspect}"

# Crear status
status = Status.create([{ order_status: 'Pendiente de revisión' },
  { order_status: 'Orden aceptada' },
  { order_status: 'Orden rechazada' },
  { order_status: 'Orden en proceso' },
  { order_status: 'Orden cancelada' },
  { order_status: 'Orden terminada' }])

puts "Status creados: #{status.inspect}"

# Crear las órdenes con sus respectivos status
orders = Order.create!([
{ service_id: services[0].id, user_id: users[4].id, status_id: status[0].id, num_people: 5, reservation: Date.today + 2.days }, # Luis compra Parrillada en Casa, orden creada
{ service_id: services[1].id, user_id: users[5].id, status_id: status[1].id, num_people: 3, reservation: Date.today + 3.days }, # Claudia compra Buffet Criollo, orden aceptada
{ service_id: services[2].id, user_id: users[3].id, status_id: status[2].id, num_people: 4, reservation: Date.today + 4.days }, # Ana compra Pizza Italiana, orden rechazada
{ service_id: services[3].id, user_id: users[2].id, status_id: status[3].id, num_people: 2, reservation: Date.today + 1.week }, # Carlos compra Comida China Gourmet, orden en proceso
{ service_id: services[4].id, user_id: users[1].id, status_id: status[4].id, num_people: 6, reservation: Date.today + 5.days }  # Maria compra Tacos Mexicanos, orden cancelada
])
puts "Órdenes creadas: #{orders.inspect}"
