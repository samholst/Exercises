require 'rspec'

def increment_value str
  str + str.next.slice(-1)
end

puts increment_value 'abcde'

describe 'Increment string value sequence' do
  it 'appends the next item in the sequence of a string' do
    expect(increment_value 'abcde').to eq('abcdef')
    expect(increment_value '123').to eq('1234')
  end
end


# array = str.scan /\w/
# last = array.last
# array.push(last.next)
# array * ""
