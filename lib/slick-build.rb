require 'rspec/core/rake_task'
require_relative 'slick-build/lib/slick-build'

 def exec_slick_build

    commit_sha = ENV['commit_sha']

    client = ChangesClient.new()
    commit = client.get_commit(commit_sha)
    puts "Commit SHA is : #{commit_sha}"

    puts 'Files:'
    puts commit.file_names.join("\n")

    #This is where a consumer could customize their build matchers
    matchers = BuildMatcherRegistry.new().get_matchers()
    build_specs = BuildMatchProcessor.new(matchers).get_build_specs(commit)

    tc = TeamCityQueueBuild.new()
    puts 'Adding to queue'

    tc.add_build_specs_to_queue(build_specs)
  end


