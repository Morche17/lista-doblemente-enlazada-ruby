require_relative 'nodo'
require 'rainbow'

class ListaDoblementeEnlazada
  attr_accessor :cabeza, :cola

  def initialize
    @cabeza = nil
    @cola = nil
  end

   def crear_nodo(dato)
    Nodo.new(dato)
  end

  def añadir_nodo(dato)
    nuevo_nodo = crear_nodo(dato)

    if @cabeza.nil?
      @cabeza = nuevo_nodo
      @cola = nuevo_nodo
    elsif dato <= @cabeza.dato
      nuevo_nodo.siguiente = @cabeza
      @cabeza.prev = nuevo_nodo
      @cabeza = nuevo_nodo
    elsif dato >= @cola.dato
      @cola.siguiente = nuevo_nodo
      nuevo_nodo.prev = @cola
      @cola = nuevo_nodo
    else
      nodo_actual = @cabeza
      while nodo_actual.siguiente != nil && nodo_actual.siguiente.dato < dato
        nodo_actual = nodo_actual.siguiente
      end

      nuevo_nodo.siguiente = nodo_actual.siguiente
      nuevo_nodo.prev = nodo_actual
      nodo_actual.siguiente.prev = nuevo_nodo
      nodo_actual.siguiente = nuevo_nodo
    end
  end

  def eliminar_nodo_especifico(nodo_a_eliminar)
  if nodo_a_eliminar == @cabeza
    @cabeza = nodo_a_eliminar.siguiente
  end

  if nodo_a_eliminar == @cola
    @cola = nodo_a_eliminar.prev
  end

  if nodo_a_eliminar.prev
    nodo_a_eliminar.prev.siguiente = nodo_a_eliminar.siguiente
  end

  if nodo_a_eliminar.siguiente
    nodo_a_eliminar.siguiente.prev = nodo_a_eliminar.prev
  end

  nodo_a_eliminar.siguiente = nil
  nodo_a_eliminar.prev = nil
end

  def buscar_nodo_por_valor(valor)
    nodo_actual = @cabeza
    while nodo_actual != nil
      if nodo_actual.dato == valor
        return nodo_actual
      end
      nodo_actual = nodo_actual.siguiente
    end
    return nil
  end

  def eliminar_nodo(valor)
    nodo_a_eliminar = buscar_nodo_por_valor(valor)
    if nodo_a_eliminar != nil
      eliminar_nodo_especifico(nodo_a_eliminar)
    end
  end

  def directo
    nodo_actual = @cabeza
    valores = ''

    loop do
      valores += Rainbow("#{nodo_actual.dato}").blue + Rainbow(" ->>").yellow
      nodo_actual = nodo_actual.siguiente
      break if nodo_actual == nil
    end

    puts "#{valores}" + Rainbow("nil").magenta
  end

  def inverso
    nodo_actual = @cola
    valores = ''

    loop do
      valores += Rainbow("#{nodo_actual.dato}").green + Rainbow(" ->>").yellow
      nodo_actual = nodo_actual.prev
      break if nodo_actual == nil
    end

    puts "#{valores}" + Rainbow("nil").magenta
  end
end
