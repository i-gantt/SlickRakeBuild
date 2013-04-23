require_relative 'commit'

class GitCommitMapper
  def map (commit_source)
    commit = Commit.new()
    return commit if (commit.nil?)
    commit.message = commit_source['commit']['message']
    file_entries = commit_source['files']
    commit.file_entries = file_entries
    commit.file_names = file_entries.map { |f| f['filename'] }
    return commit
  end

end