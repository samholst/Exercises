def full_name first_name last_name
  first_name + " " + last_name
end

puts full_name "Sam", "Holst"

def print_address city:, state:, zip:
  puts city
  puts state
  puts zip
end 

print_address city: "Orem", state: "UT", zip: 84057

def sms_generator api_key:, num:, msg:, locale:
  #magic sms stuff...
end

sms_generator num: '702-335-8019', api_key: 'adf31231sdfa', msg: 'hey there', locale: 'US'

# Make a default argument for LANG, if most of the time it is ENG
def stream_movie title:, lang: "ENG"
  puts title
  puts lang
end

stream_movie title: "The fountainhaid", lang: "SPAN"
stream_movie title: "The fountainhaid"