class Commit
  attr_accessor :file_entries, :file_names, :message

  def initialize
    @file_entries = Array.new()
    @file_names = Array.new()
    @message = ''
  end

end

