#branch = 'refs/heads/teamcity-add-to-queue'
branch = 'teamcity-add-to-queue'
puts 'Has refs/heads' if branch =~ /refs\/heads\//
puts branch.gsub(/refs\/heads\//,'')