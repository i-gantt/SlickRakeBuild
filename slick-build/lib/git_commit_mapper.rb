require_relative 'commit'

class GitCommitMapper
  def map (commit_source)
    commit = Commit.new()
    return commit if (commit.nil?)
    commit.message = commit_source['commit']['message']
    file_entries = commit_source['files']
    commit.file_entries = file_entries
    commit.file_names = extract_filenames(file_entries)
    return commit
  end

  def extract_filenames (file_entries)
    parsed_files = []
    file_entries.each do |f|
      parsed_files << f['filename']
    end
    parsed_files
  end
end