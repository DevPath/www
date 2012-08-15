deploy = require './s3-deployer'
cp = require 'child_process'

cp.spawn "sh", ['-c', 'make build']
deploy.dir "#{__dirname}/public"
