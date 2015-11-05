require 'rake'
require 'aws-sdk'
require 'time'

## CONSTANTS ##
PWD = File.dirname(__FILE__)
PACKAGE_DIR = File.join(PWD, 'package')
###############

## TASKS ##

  task :default => [:publish_package_s3]

  desc 'publishes artifacts to the s3 bucket.'
  task :publish_package_s3

###########

Aws.use_bundled_cert!
Aws.config.update({
  region: 'eu-west-1',
  credentials: Aws::Credentials.new(ENV['AWS_SECRET'], ENV['AWS_KEY'])
})

task :publish_package_s3 do
  begin
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    obj = s3.bucket('s3-deployment-artifacts').object('Path/1.0.tar.gz')
    obj.upload_file('1.0.tar.gz')
  rescue Aws::S3::Errors::ServiceError
    # rescues all errors returned by Amazon Simple Storage Service
  end
end

