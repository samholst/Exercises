require 'rspec'
# http://blog.honeybadger.io/ruby-rational-numbers-and-fractions/
# https://stackoverflow.com/questions/20019668/ruby-string-to-operator


def fraction_calculator fraction_one, fraction_two, operator
  ((fraction_one.to_r).method(operator).(fraction_two.to_r)).to_s
end

describe 'Fraction multiplication' do
  it 'can multiply two fractions and output the value in a string based fraction format' do
    expect(fraction_calculator("1/3", "2/4", "*")).to eq("1/6")
    expect(fraction_calculator("1/3", "2/4", "/")).to eq("2/3")
    expect(fraction_calculator("1/3", "2/4", "+")).to eq("5/6")
    expect(fraction_calculator("1/3", "2/4", "-")).to eq("-1/6")
  end
end
