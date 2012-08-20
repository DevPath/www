fs = require 'fs'
knox = require 'knox'

client = knox.createClient
  key: process.env.S3KEY
  secret: process.env.S3SECRET
  bucket: 'www.devpathchicago.com'


deploy = {}
module.exports = deploy

deploy.dir = (path) ->
  @read path, (err, paths) =>
    if err then throw err
    @upload paths


deploy.read = (dir, cb) ->
  results = []

  fs.readdir dir, (err, list) ->
    if err then return cb err
    i = 0

    do next = ->
      file = list[i++]
      if !file then return cb null, results
      file = "#{dir}/#{file}"
      fs.stat file, (err, stat) ->
        if stat and stat.isDirectory()
          deploy.read file, (err, res) ->
            results = results.concat res
            next()
        else
          results.push file
          next()


deploy.upload = (paths) ->
  paths.forEach (path) ->
    splitFileName = path.split '/'
    fileName = splitFileName[splitFileName.length - 1]
    client.putFile path, "/#{fileName}", (err, res) ->
      console.log 'error putting', path, "/#{fileName}"
      if err then throw err
      console.log "Deployed #{path}"
