require 'rspec'

def sample
  true
end

describe 'test' do
  it 'does a sample test' do
    expect(sample).to eq(true)
  end
end

