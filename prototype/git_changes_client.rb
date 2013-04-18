require 'rest-client'

class GitChangesClient
  attr_reader :git_repo_uri

  def initialize
    @git_repo_uri = 'https://api.github.com/repos/cliffburger/slickrakebuild'
  end

  def get_commits
    RestClient.get "#{@git_repo_uri}/commits", {:accept => :json}
  end

  def get_commit (commit_hash)
    RestClient.get "#{@git_repo_uri}/commits/#{commit_hash}", {:accept => :json}
  end
end