require 'rake'

## CONSTANTS ##
PWD = File.dirname(__FILE__)
PACKAGE_DIR = File.join(PWD, 'package')
###############

## TASKS ##

  task :default => [:publish_package_s3]

  desc 'publishes artifacts to the s3 bucket.'
  task :publish_package_s3

###########

task :publish_package_s3 do
  puts PACKAGE_DIR
end

