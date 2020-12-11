=begin
  ~ Exercise Desciption ~
  
  4) Implementar o método Array#my_join (lê-se "o método de 
    instância :my_join da classe Array") com o mesmo 
    comportamento do método :join. 
      
  Exemplos de uso:

  > ['a', 'b', 'c'].my_join
  => "abc"
  > ['a', 'b', 'c'].my_join(':')
  => "a:b:c"
  > [1, 2, 3].my_join
  => "123"
  > [1, 2, 3].my_join('|')
  => "1|2|3"

  Dicas:

  - Usem o método :reduce.

  - Lembrem-se que o delimitador pode ou não ser passado como 
    parâmetro do :my_join. Se não for passado, o valor '' 
    deverá ser usado por padrão.

  - Levem em consideração que os elementos do array podem ou 
    não ser strings. Basta ver o exemplo `[1, 2, 3].my_join` 
    acima.

  - Se precisarem remover algum texto do final de uma string, 
    lembrem-se do método String#chomp 
    (https://ruby-doc.org/core-2.7.1/String.html#method-i-chomp-21).

  - Modelo:

  class Array
    def my_join(delimiter = '')
      '...'
    end
  end
=end

# Method:

class Array
  def my_join(delimiter = '')
    reduce { |acc, i| acc.to_s + delimiter.to_s + i.to_s }
  end
end

# Testing:

puts [1, 2, 3, 4, 5].my_join 0
#==> '102030405'
puts [1, 2, 3, 4, 5].my_join '||'
#==> '1||2||3||4||5'
puts ['a','b','c','d'].my_join []
#==> 'a[]b[]c[]d'
puts [1, 2, 3, 4, 5, 6, 7, 8].my_join
#==> 12345678