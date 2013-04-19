require_relative 'spec_helper'

commit_sha = '61011100f8f69b8afe9c9fd3d73f3022d4f8c475'
puts GitChangesClient.new().get_commit(commit_sha).length

client = ChangesClient.new()
commit = client.get_commit(commit_sha)

puts "Message: #{commit.message}"
puts "#{commit.file_entries.length} files: "
commit.files.each do |file|
  puts file['filename']
end