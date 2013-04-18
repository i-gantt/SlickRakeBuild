require 'rest-client'

class GitChangesClient
  attr_reader :git_repo_uri

  def initialize
    @git_repo_uri = 'https://api.github.com/repos/cliffburger/slickrakebuild'
  end

  def get_commits
    RestClient.get "#{@git_repo_uri}/commits", { :accept => :json }
  end

  def get_commit (commit_hash)
    RestClient.get "#{@git_repo_uri}/commits/#{commit_hash}", { :accept => :json }
  end
end

# How would we test this with rspec?
puts GitChangesClient.new().get_commits
puts GitChangesClient.new().get_commit('61011100f8f69b8afe9c9fd3d73f3022d4f8c475')