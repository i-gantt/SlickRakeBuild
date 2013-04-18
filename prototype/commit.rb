class Commit
  attr_accessor :files, :message

  def initialize
    @files = Array.new()
    @message = ''
  end

end

class GitCommitMapper
  def map (commit_source)
    commit = Commit.new()
    return commit if (commit.nil?)
    commit.message = commit_source['commit']['message']
    commit.files = commit_source['files']

    return commit
  end
end
