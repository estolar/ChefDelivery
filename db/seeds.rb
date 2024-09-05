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
  { email: 'claudia@example.com', password: 'password', first_name: 'Claudia', last_name: 'Ramirez', address: 'Iquitos' }
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
  { name: 'Buffet Criollo', description: 'Comida criolla para eventos especiales', cost: 250.00, category: Category.find_by(category: 'Comida Peruana'), user: users[1] },
  { name: 'Pizza Italiana', description: 'Pizza hecha en horno de leña con ingredientes frescos', cost: 100.00, category: Category.find_by(category: 'Comida Italiana'), user: users[2] },
  { name: 'Comida China Gourmet', description: 'Exquisitos platillos chinos para tus eventos', cost: 200.00, category: Category.find_by(category: 'Comida China'), user: users[0] },
  { name: 'Tacos Mexicanos', description: 'Auténticos tacos mexicanos con los mejores ingredientes', cost: 180.00, category: Category.find_by(category: 'Comida Mexicana'), user: users[3] }
])

# Adjuntar varias imágenes
images_service1 = [
  { url: "https://i0.wp.com/www.brasasysabores.com/wp-content/uploads/2017/06/servicio-de-parrilla-argentina-para-comunio%CC%81n.jpg", filename: "nes1.png" },
  { url: "https://i0.wp.com/www.brasasysabores.com/wp-content/uploads/2017/06/servicio-de-parrilla-argentina-para-comunio%CC%81n.jpg", filename: "nes2.png" }
]

images_service1.each do |image|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  services[0].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service2 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service2.each do |image|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  services[1].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service3 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service3.each do |image|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  services[2].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service4 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service4.each do |image|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  services[3].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

images_service5 = [
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg", filename: "nes1.png" },
  { url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/NES-Game-Cartridge.jpg/1200px-NES-Game-Cartridge.jpg", filename: "nes2.png" }
]

images_service5.each do |image|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  services[4].photos.attach(io: file, filename: image[:filename], content_type: "image/png")
end

puts "Servicios creados: #{services.inspect}"

# Crear órdenes
orders = Order.create!([
  { service_id: services[0].id, user_id: users[4].id }, # Luis compra Parrillada en Casa
  { service_id: services[1].id, user_id: users[5].id }, # Claudia compra Buffet Criollo
  { service_id: services[2].id, user_id: users[3].id }, # Ana compra Pizza Italiana
  { service_id: services[3].id, user_id: users[2].id }, # Carlos compra Comida China Gourmet
  { service_id: services[4].id, user_id: users[1].id }  # Maria compra Tacos Mexicanos
])

puts "Órdenes creadas: #{orders.inspect}"
