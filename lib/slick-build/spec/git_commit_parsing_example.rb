require_relative 'spec_helper'

commit_sha = '420651230590930abae5febdc4f4e8d18b34bf43'
puts GitChangesClient.new().get_commit(commit_sha).length

client = ChangesClient.new()
commit = client.get_commit(commit_sha)

puts "Message: #{commit.message}"
puts "#{commit.file_entries.length} files: "
commit.file_names.each do |file|
  puts file
end