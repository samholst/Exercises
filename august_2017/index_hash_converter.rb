require 'rspec'

class Array
  def index_hash
    # self.each_with_object({}) do |item, hash|
    #   hash[self.index] = item
    # end
    (0...size).zip(self).to_h
  end
end

arr = %w{the quick brown fox}
p arr.index_hash

describe 'Array to Hash converter' do
  it 'converts an array to a hash, with the keys being the index and the value being the element' do
    arr = %w{the quick brown fox}
    expect(arr.index_hash).to eq({0=>"the", 1=>"quick", 2=>"brown", 3=>"fox"})
  end
end
