require '../lib/wolfram-query'
require 'yaml'

my_query = WolframQuery.new()
my_query.appid = YAML.load_file('../config/api.yml')['development']['key']

my_query.input = "3+5"


puts my_query.go
puts my_query.error
puts my_query.request_url
