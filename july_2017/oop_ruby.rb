class ApiConnector
  attr_accessor :title, :description, :url

  def initialize(title, description, url = "google.com")
    @title = title
    @description = description
    @url = url
  end

  def testing_initializer
    puts @title
    puts @description
    puts @url
  end

  def test_method
    puts "testing class call"
  end
end

api = ApiConnector.new
api.url = "https://www.google.com"
puts api.url


api_2 = ApiConnector.new("My title", "My cool description")
api_2.testing_initializer
