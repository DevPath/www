fs = require 'fs'
jade = require 'jade'

template = {}
module.exports = template

template.render = (@input, @output) ->
  fs.readdir input, (err, files) =>
    files.forEach (file) => @read file


template.read = (file) ->
  options = {}
  locals = {}

  fs.readFile "#{@input}/#{file}", 'utf8', (err, contents) =>
    readTemplate = jade.compile contents, options
    compiledTemplate = readTemplate locals
    compiledFilePath = "#{@output}/#{file.replace 'jade', 'html'}"
    @write compiledFilePath, compiledTemplate


template.write = (compiledFilePath, compiledTemplate) ->
  fs.writeFile compiledFilePath, compiledTemplate, 'utf8', (err) ->
    if err then throw err
    console.log "Compiled #{compiledFilePath}"
