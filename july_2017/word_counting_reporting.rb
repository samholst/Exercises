require 'rspec'

class String
  def total_words
    scan(/\w+/).count
  end

  def word_list
    list = Hash.new(0)
    downcase.scan(/\w+/) { |word| list[word] += 1 }
    list
  end
end

describe 'Word Reporter' do
  before do
    @str = "- the quick brown fox / jumped over the lazy fox."
  end

  it 'Counts words accurately' do
    expect(@str.total_words).to eq(9)
  end

  it 'Returns a hash that totals up word usage' do
    expect(@str.word_list).to eq(
                                  {
                                  "the"=>2,
                                  "quick"=>1,
                                  "brown"=>1,
                                  "fox"=>2,
                                  "jumped"=>1,
                                  "over"=>1,
                                  "lazy"=>1
                                  }
                                )
  end
end

# This is called monkey patching (when you modify original classes, in this case, "class String")

# My first round approach to it without regex
# self.tr("'-/–…\.!?", '').split.count
# words = self.tr("'-/–…\.!?", '').split


# Second attempt
# self.gsub(/\W+|\d+/, ' ').split.count
# words = self.gsub(/\W+|\d+/, ' ').split

# Third attempt
# words = scan(/\w+/)