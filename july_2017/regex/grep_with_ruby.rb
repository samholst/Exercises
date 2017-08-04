arr = [1, 3, 2, 12, 1, 2, 3]
p arr.grep(1)



arr = ['hey.rb', 'there.rb', 'index.html']

p arr.select { |x| x=~ /\.rb/ }.map{ |x| x[0..-4]}

p arr.grep(/(.*)\.rb/){$1}
