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
    return get_build_specs_from_ids(commit, flat_builds)
  end

  def get_build_specs_from_ids(commit, build_ids)
    specs = []
    build_ids.each do |build_id|
      spec = BuildSpec.new
      spec.build_id = build_id
      spec.commit = commit
      specs << spec
    end
    return specs
  end
end

class BuildSpec
  attr_accessor :build_id, :commit
end