require_relative 'commit'

class BuildMatcher
  attr_accessor :build_ids

  def initialize(build_ids)
    @build_ids = build_ids
  end

  def get_applicable_builds(commit)
    return @build_ids
  end
end

class PatternBuildMatcher < BuildMatcher
  attr_accessor :file_pattern, :message_pattern

  def get_applicable_builds(commit)
    return @build_ids if matches_file commit.file_names
    return @build_ids if matches_message commit.message

    return []
  end

  def matches_file(file_names)
    return false if file_names.nil? || file_names.length == 0
    return false if file_pattern.nil? || file_pattern.length == 0
    return file_names.any? { |f| !f.match(file_pattern).nil? }
  end

  def matches_message(message)
    return false if message.nil? || message.length == 0
    return false if message_pattern.nil? || message_pattern.length == 0

    return !message.match(message_pattern).nil?
  end
end