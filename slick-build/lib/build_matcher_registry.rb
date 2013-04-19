require_relative 'build_matcher'

#WARNING: I'm not complete. Please fix me.
class BuildMatcherRegistry

  def get_matchers
    return [bowling_matcher, cows_and_bulls]
  end

  def bowling_matcher
    create_pattern_matcher(['bt1597'], 'bowling', '#bowling')
  end

  def cows_and_bulls
    create_pattern_matcher(['bt1596'], 'cows_and_bulls', '#cows')
  end

  def prototype
    create_pattern_matcher(['bt1596'], 'prototype', '#prototype')
  end

  def create_pattern_matcher(build_ids, file_pattern, message_pattern = '')
    matcher = PatternBuildMatcher.new([build_ids])
    matcher.file_pattern = file_pattern
    matcher.message_pattern = message_pattern
    return matcher
  end
end