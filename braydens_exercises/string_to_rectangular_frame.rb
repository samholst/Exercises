# *********
# * Hello *
# * Wolrd *
# * in    *
# * a     *
# * frame *
# *********

def make_rectangle sentence
  arr = sentence.split
  max_length = arr.max_by(&:length).length

  puts "*" * (max_length + 4)
    arr.each do |word|
      diff = max_length - word.length
      print "* "
      print word
      print " " * diff
      puts " *"
    end
  puts "*" * (max_length + 4)
end

phrase = "Hello World in a frame"
p make_rectangle phrase
