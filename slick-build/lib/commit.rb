class Commit
  attr_accessor :files, :message

  def initialize
    @files = Array.new()
    @message = ''
  end

  def file_names
    # TODO: if perf becomes a problem, create a parsed_file_cache, comparing the length with that of files.
    # create a setter that does this, or do translation in the mapper.
    parsed_files = []
    @files.each do |f|
      parsed_files << f['filename']
    end

    return parsed_files
  end
end

