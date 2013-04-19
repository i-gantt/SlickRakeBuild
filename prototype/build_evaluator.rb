require_relative '../slick-build/lib/slick-build'

module BuildEvaluator
  def self.get_build_id(commit_sha)
    changes_client = ChangesClient.new()
    commit_info = changes_client.get_commit(commit_sha)

    puts commit_info
    commit_info.files.each do |file|
      puts "Current file is: #{file['filename']}"

      res = Prototype::FILE_MATCH.include?(file['filename'])
      puts "Result of looking for Prototype find is: #{res}"

      if BowlingMap::FILE_MATCH.find(file['filename'])
        puts 'Should trigger Bowling Build'
        return BowlingMap::BT_ID
      elsif CowsAndBulls::FILE_MATCH.find(file['filename'])
        puts 'Should trigger Cows and Bulls build'
        return CowsAndBulls::BT_ID
      elsif Prototype::FILE_MATCH.find(file['filename'])
        puts 'Should trigger the Prototype build'
        return Prototype::BT_ID
      end
    end

  end
end


