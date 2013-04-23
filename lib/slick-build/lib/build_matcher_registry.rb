require_relative 'build_matcher'

class BuildMatcherRegistry
  BowlingBuild = 'bt1597'
  CowBuild = 'bt1596'

  def get_matchers
    return [bowling_matcher, cows_and_bulls]
  end

  def bowling_matcher
    create_pattern_matcher([BowlingBuild], 'bowling', '#bowling')
  end

  def cows_and_bulls
    create_pattern_matcher([CowBuild], 'cows_and_bulls', '#cows')
  end

  def create_pattern_matcher(build_ids, file_pattern, message_pattern = '')
    matcher = PatternBuildMatcher.new(build_ids)
    matcher.file_pattern = file_pattern
    matcher.message_pattern = message_pattern
    return matcher
  end
end
