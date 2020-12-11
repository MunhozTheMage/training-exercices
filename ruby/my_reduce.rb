=begin
  ~ Exercise Desciption ~
  
  2) Tentem implementar sua própria versão do método `reduce`,
    chamado `my_reduce`, diretamente na classe Array:

  class Array
    def my_reduce(starting_accumulator = nil)
      ...
    end
  end

  De forma que obtenham estes resultados:

  > [1, 2, 3, 4, 5].my_reduce(1) { |acc, i| acc * i }
  => 120

  > [1, 2, 3, 4, 5].my_reduce { |acc, i| acc * i }
  => 120

  Obs: o `reduce` original não é um método da classe Array, 
  mas sim do módulo Enumerable: 
  
  https://ruby-doc.org/core-2.4.0/Enumerable.html#method-i-reduce
=end

# Method:

class Array
  def my_reduce (initial = nil, &block)
    acc = initial || self[0]

    $i = initial.nil? ? 1 : 0
    begin
      acc = yield acc, self[$i]
      $i +=1;
    end until $i >= self.size

    acc
  end
end

# Testing:

puts [ 1, 2, 3, 4 ].my_reduce(0) { |acc, i| i }
#==> 4
puts [ 1, 2, 3, 4 ].my_reduce(5) { |acc, i| i + acc }
#==> 15
puts [1, 2, 3, 4, 5].my_reduce(1) { |acc, i| acc * i }
#==> 120
puts [1, 2, 3, 4, 5].my_reduce { |acc, i| acc * i }
#==> 120