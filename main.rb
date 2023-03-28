require_relative 'src/lista_doble'
# require 'byebug'

lista = ListaDoblementeEnlazada.new

# Iteración para agregar nodos aleatorios a la lista
# (1..10).each do |iteración|
#   lista.añadir_nodo(rand(1..10))
# end

# Agregar algunos nodos a la lista
lista.añadir_nodo(2)
lista.añadir_nodo(4)
lista.añadir_nodo(3)
lista.añadir_nodo(5)
lista.añadir_nodo(1)
lista.añadir_nodo(0.5)

# byebug
puts "\nRecorrido hacia adelante: "
lista.directo

puts "\nRecorrido hacia atrás: "
lista.inverso

lista.eliminar_nodo(2)

puts "\nRecorrido hacia adelante después de eliminar un nodo: "
lista.directo
