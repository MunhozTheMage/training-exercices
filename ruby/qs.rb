=begin
  ~ Exercise Desciption ~
  
  3) Permitir ao método Array#qs implementado anteriormente 
    que receba um bloco opcional, o qual poderá ser usado 
    para alterar a forma como 2 elementos da coleção são 
    comparados, permitindo na prática que se faça qualquer 
    tipo de comparação, similar à forma como o método :sort 
    funciona.

  Exemplos de uso:

  > [3, 2, 4, 5, 0, 1].qs
  => [0, 1, 2, 3, 4, 5]

  > [3, 2, 4, 5, 0, 1].qs { |a, b| b <=> a }
  => [5, 4, 3, 2, 1, 0]

  Função Quick Sort:

  class Array
    def qs
      return self if size <= 1

      pivot, *rest = self
      lowest_or_equal = rest.select { |item| item <= pivot }
      highest = rest.select { |item| item > pivot }

      lowest_or_equal.qs + [pivot] + highest.qs
    end
  end
=end

# Methods:

class Array
  # Original qs method.
  def qs
    return self if size <= 1

    pivot, *rest = self
    lowest_or_equal = rest.select { |item| item <= pivot }
    highest = rest.select { |item| item > pivot }

    lowest_or_equal.qs + [pivot] + highest.qs
  end

  # My qs method.
  def my_qs (&block)
    return self if size <= 1

    pivot, *rest = self

    if block_given? 
      lowest_or_equal = []
      highest = []

      rest.each do |item| 
        compare = yield item, pivot
        highest.push item if compare > 0
        lowest_or_equal.push item if compare <= 0
      end

      lowest_or_equal.my_qs { |item_, pivot_| yield item_, pivot_ } + [pivot] + highest.my_qs { |item_, pivot_| yield item_, pivot_ }
    else 
      lowest_or_equal = rest.select { |item| item <= pivot }
      highest = rest.select { |item| item > pivot }
      lowest_or_equal.my_qs + [pivot] + highest.my_qs
    end
  end
end

# Testing:

# For test purposes only.
class Integer 
  def sum_digits 
    to_s.split('').reduce(0) { |acc, digit| acc.to_i + digit.to_i }
  end
end

puts [3, 4532, 2, 123, 54, 93523].qs
#==> [ 2, 3, 54, 123, 4532, 93523 ]
puts "==================================================="

puts [123, 55, 11111, 9].my_qs { |item, pivot| item.sum_digits - pivot.sum_digits }
#==> [ 11111, 123, 9, 55 ]
puts "==================================================="

puts [3, 2, 4, 5, 0, 1].my_qs
#==> [0, 1, 2, 3, 4, 5]
puts "==================================================="

puts [3, 2, 4, 5, 0, 1].my_qs { |a, b| b <=> a }
#==> [5, 4, 3, 2, 1, 0]