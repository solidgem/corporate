if ENV['AWS_S3_BUCKET']
  aws = {
      access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
      region: ENV['AWS_S3_REGION'],
      bucket: ENV['AWS_S3_BUCKET'],
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end

if ENV['AWS_CLOUDFRONT_DOMAIN']
  Refile.host = ENV['AWS_CLOUDFRONT_DOMAIN']
end
