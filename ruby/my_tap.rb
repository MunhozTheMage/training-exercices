=begin
  ~ Exercise Desciption ~

  1) Todos os objetos em Ruby têm um método chamado `tap`,
    que passa o receiver (self) para o bloco associado e 
    depois retorna o próprio receiver (self). Note que o 
    bloco é mandatório neste método.

  Ex de uso:

  (1..10)               .tap { |x| puts "original: #{x}" }.
  to_a                  .tap { |x| puts "array:    #{x}" }.
  select { |x| x.even? }.tap { |x| puts "evens:    #{x}" }.
  map { |x| x * x }     .tap { |x| puts "squares:  #{x}" }

  Saída:

  original: 1..10
  array:    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  evens:    [2, 4, 6, 8, 10]
  squares:  [4, 16, 36, 64, 100]

  Tentem implementar um método similar na classe Object, 
  chamado `my_tap`:

  class Object
    def my_tap(&block)
      ...
    end
  end

  E depois tentem usá-lo da mesma forma:

  (1..10)               .my_tap { |x| puts "original: #{x}" }.
  to_a                  .my_tap { |x| puts "array:    #{x}" }.
  select { |x| x.even? }.my_tap { |x| puts "evens:    #{x}" }.
  map { |x| x * x }     .my_tap { |x| puts "squares:  #{x}" }
=end

# Method:

class Object
  def my_tap (&block)
    yield self
    self
  end
end

# Testing:

(1..10)               .my_tap { |x| puts "original: #{x}" }.
to_a                  .my_tap { |x| puts "array:    #{x}" }.
select { |x| x.even? }.my_tap { |x| puts "evens:    #{x}" }.
map { |x| x * x }     .my_tap { |x| puts "squares:  #{x}" }