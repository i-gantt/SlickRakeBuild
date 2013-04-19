require 'commit'

class BuildMatchProcessor
  attr_reader :build_matchers

  def initialize (build_matchers)
    @build_matchers = build_matchers
  end

  def get_build_specs(commit)
    return [] if build_matchers.nil? || build_matchers.length == 0

    builds = build_matchers.map do |matcher|
      matcher.get_applicable_builds(commit)
    end

    flat_builds = builds.flat_map { |b| b }
    unique_builds = flat_builds.group_by { |b| b }.map { |g| g }

    return get_build_specs_from_ids(commit, unique_builds)
  end

  def get_build_specs_from_ids(commit, build_ids)
    build_ids.map do |build_id|
      spec = BuildSpec.new
      spec.build_id = build_id
      spec.commit = commit
    end
  end
end

class BuildSpec
  attr_accessor :build_id, :commit
end