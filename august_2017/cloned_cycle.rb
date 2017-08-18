require 'rspec'

def cloned_cycle collection, num
  # Array.new(num, collection).flatten
  final_items = []

  num.times do
    collection.each do |x|
      final_items << x
    end
  end

  final_items
end

arr = [1..3]
p cloned_cycle(arr, 3)


describe 'Cloned cycle' do
  it 'Iterates through an array a variable number of times and returns the full set of elements' do
    arr = [1, 2, 3]
    expect(cloned_cycle(arr, 3)).to eq([1, 2, 3, 1, 2, 3, 1, 2, 3])
  end
end
