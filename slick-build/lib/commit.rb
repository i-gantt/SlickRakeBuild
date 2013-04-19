class Commit
  attr_accessor :files, :message

  def initialize
    @files = Array.new()
    @message = ''
  end
end

