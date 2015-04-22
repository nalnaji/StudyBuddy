ENV["REDISTOGO_URL"] ||= 'redis://localhost:6379'
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => uri)
