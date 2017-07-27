require 'rspec'

class Hash
  # The * against the = and & will convert the whole thing to a string
  # The value is not neccesary because it just interpolates topic=#{value} automatically
  def param_converter
    self.map { |i| i * "="} * "&"
  end
end

hash = { :topic => "baseball", :team => "astros" }
p hash.param_converter

describe 'HTML Param Converter' do
  it 'Adds an HTML param converter to the Hash class' do
    hash = { :topic => "baseball", :team => "astros" }
    expect(hash.param_converter).to eq('topic=baseball&team=astros')
  end
end