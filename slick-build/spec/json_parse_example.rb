require_relative 'spec_helper'

raw_json = File.read(File.join(File.dirname(__FILE__), 'commit_example.json'))

parser = JSON.parser.new(raw_json)

hash = parser.parse
message = hash['commit']['message']
puts message

files = hash['files']
puts files[0]['filename']