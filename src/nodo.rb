class Nodo
  attr_accessor :dato, :prev, :siguiente

  def initialize(dato)
    @dato = dato
    @prev = nil
    @siguiente = nil
  end
end
