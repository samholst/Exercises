def wordize int
  numbers_names = {
                    1000000 => "million",
                    1000 => "thousand",
                    100 => "hundred",
                    90 => "ninety",
                    80 => "eighty",
                    70 => "seventy",
                    60 => "sixty",
                    50 => "fifty",
                    40 => "forty",
                    30 => "thirty",
                    20 => "twenty",
                    19 => "nineteen",
                    18 => "eighteen",
                    17 => "seventeen",
                    16 => "sixteen",
                    15 => "fifteen",
                    14 => "fourteen",
                    13 => "thirteen",
                    12 => "twelve",
                    11 => "eleven",
                    10 => "ten",
                    9 => "nine",
                    8 => "eight",
                    7 => "seven",
                    6 => "six",
                    5 => "five",
                    4 => "four",
                    3 => "three",
                    2 => "two",
                    1 => "one",
                  }
  wordize_string = []

  return "" if int == 0
  
  numbers_names.each_pair do |num, word|
    diff = int / num
    
    if diff == 1
      wordize_string << "#{numbers_names[} #{word}"
      int = int - (num * diff)
    elsif diff > 1
      wordize_string << "1 #{word}"
      int = int - (num * diff)
    end
  end

  wordize_string.join(" ")
end

wordize(151)







