require 'benchmark'
# Calculate the number of gold pieces on a chessboard given that the number on each square doubles.
#
#    There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up. Knowing that the king loved chess, the servant told the king he would like to have gold pieces. One gold piece on the first square of a chess board. Two gold pieces on the next. Four on the third, and so on.
#
#        There are 64 squares on a chessboard.
#
#           Write code that shows:
#
#            how many gold pieces were on each square, and
#            the total number of gold

# p chessboard1 = Array.new(64) { |i| i == 0 ? 1 : i * 2 }

class Chessboard
  def initialize
    @chessboard = Array.new
  end

  def place_gold
    64.times do |x|
      if x == 0
        @chessboard[x] = 1
      else
        @chessboard[x] = @chessboard[x - 1] * 2
      end
    end

    @chessboard
  end

  def count_gold
    @chessboard.inject(&:+)
  end
end

chess = Chessboard.new
p chess.place_gold
p chess.count_gold

# Benchmark.bm(100) do |x|
#   x.report('Place Gold: ') { chess.place_gold }
#   x.report('Count:      ') { chess.count_gold }
# end
