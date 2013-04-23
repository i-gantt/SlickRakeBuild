require_relative 'git_changes_client'
require_relative 'commit'
require_relative 'git_commit_mapper'
require 'json'

class ChangesClient

  def initialize
    @rest_client = GitChangesClient.new()
  end

  def get_commit_json (commit_hash)
    @rest_client.get_commit commit_hash
  end

  def parse_commit_json (commit_json)
    commit = Commit.new()
    begin
      parser = JSON.parser.new(commit_json)
      hash = parser.parse

      mapper = GitCommitMapper.new()
      commit = mapper.map(hash)
    rescue JSON::ParserError
      # ignored
    end
    return commit
  end

  def get_commit(commit_hash)
    json = get_commit_json(commit_hash)
    return parse_commit_json (json)
  end
end


