# Obtener las categorías existentes
categories = Category.all

# Obtener usuarios existentes
users = User.all

# Crear servicios y asegurar que se asignan usuarios y categorías correctamente
services = Service.create!([
  { name: 'Parrillada en Casa', description: 'Deliciosa parrillada a domicilio con carne de primera', cost: '150.00', category: categories.find_by(category: 'Parrilla'), user: users[0] },
  { name: 'Buffet Criollo', description: 'Comida criolla para eventos especiales', cost: '250.00', category: categories.find_by(category: 'Comida Peruana'), user: users[1] },
  { name: 'Pizza Italiana', description: 'Pizza hecha en horno de leña con ingredientes frescos', cost: '100.00', category: categories.find_by(category: 'Comida Italiana'), user: users[2] },
  { name: 'Comida China Gourmet', description: 'Exquisitos platillos chinos para tus eventos', cost: '200.00', category: categories.find_by(category: 'Comida China'), user: users[0] },
  { name: 'Tacos Mexicanos', description: 'Auténticos tacos mexicanos con los mejores ingredientes', cost: '180.00', category: categories.find_by(category: 'Comida Mexicana'), user: users[3] }
])

# Depuración: Imprime los servicios para verificar que se hayan creado correctamente
puts "Servicios creados: #{services.inspect}"
