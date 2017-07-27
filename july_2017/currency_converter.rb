require 'rspec'

# ¥
# £
# $

def currency_converter amount, location
   case location
      when 'US'
        "$%.2f" % amount
      when 'Japan'
        "¥%.0f" % amount
      when 'UK'
        ("£%.2f" % amount).gsub('.', ',')
    end 
end

puts currency_converter 40, 'Japan'

describe 'Currency converter' do
  it 'can properly format currency for US, Japan, and UK' do
    expect(currency_converter 5000, 'US').to eq('$5000.00')
    expect(currency_converter 5000, 'Japan').to eq('¥5000')
    expect(currency_converter 5000, 'UK').to eq('£5000,00')
  end
end