require 'rest-client'
require 'json'
require 'net/http'
require 'uri'

class TeamCityQueueBuild

  # Guest user credentials for unprivileged access
  GUEST_USER = {:username => 'guest', :password => 'password'}

  # Username and password for the privileged user in teamcity to add builds to queue
  #attr_accessor :username
  #attr_accessor :password

  # Instantiate the teamcity class, loading environment variables into instance variables.
  def initialize
    @username = TeamCityQueueBuild::load_var!('TC_USERNAME')
    @password = TeamCityQueueBuild::load_var!('TC_PASSWORD')
    @base_url = TeamCityQueueBuild::load_var!('TC_BASE_URL')
    @branch = ENV['branch']
    @branch = 'master' if @branch.nil? || @branch.length == 0
    #@commit_hash = load_var('TC_COMMIT_HASH')
  end

  public

  # Add a build to the queue by build type id
  # Requires a valid user with permissions to execute.
  def add_build_to_queue(build_type_id)
    action = 'add2Queue'
    path = "/httpAuth/action.html?#{action}=#{build_type_id}&branchName=#{@branch}"
    puts "Queue build #{build_type_id} on #{@branch} with #{path}"
    execute_get_web_request(path,false) #generate_request(path)
    puts 'Done with web request'
  end

  def add_builds_to_queue(build_type_ids)
    build_type_ids.each do |btid|
      add_build_to_queue btid
    end
  end

  private

  # Get the environment variables set by teamcity, or raise an exception if they are not set.
  def self.load_var!(name)
      if (ENV.has_key? name) && (!ENV[name].nil?)
        return ENV[name]
      else
        raise "TeamCity Environment variable [#{name}] is not set"
      end
  end

  # Execute a web request
  def execute_get_web_request(path,guest=false)
    if(guest)
      username=GUEST_USER[:username]
      password=GUEST_USER[:password]
    else
      username=@username
      password=@password
    end
    uri=URI.parse "#{@base_url}#{path}"
    puts "sending web request to #{uri.to_s}"
    http_obj=Net::HTTP.new(uri.host, uri.port)
    request=Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth(username,password)
    http_obj.request(request).code
  end

  # Throws an exception if the request fails.
  def execute_get_web_request!(path,guest=false)
    response_code = execute_get_web_request(path,guest)
    if '200' != response_code
      raise('Web Request to TeamCity failed')
    else
      puts "Response Code: #{response_code}"
    end
  end

end



