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
