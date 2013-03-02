path = require 'path'
fs = require 'fs'

module.exports = (BasePlugin) ->

	class Tags extends BasePlugin

		name: "tags"

		constructor: ->
			@tags = {}
			super

		getOrCreateCategory: (name) ->
			return @tags[name] if @tags[name]?
			tag = []
			@tags[name] = tag
			return tag

		addToCategory: (categoryName, document) ->
			category = @getOrCreateCategory(categoryName)
			category.documents.add document

		parseAfter: (opts, next) ->
			next()
			# Requires
			# logger = @logger
			# logger.log "info", "Parse after"
			# documents = @docpad.documents
			
			# unless documents.length
			# 	return next()
			
			# documents.forEach (document) =>
			# 	docTags = document.get('tags') or []
				
			# 	@addToCategory(name, document) for name in categoryNames

			
			# @tmpPath = @docpad.config.rootPath + '/tmp/' + @name
			# tmpCategories = @tmpPath + '/category'
			# logger.log "info", tmpCategories

			# #
			# # Where would be a better place to prepare (and clean) the tmp directory?
			# #
			# balUtil.ensurePath tmpCategories, (err) =>
			# 	logger.log "info", "Ensured path!"
			# 	logger.log 'warn', err if err
			# 	for name, category of @categories
			# 		fileFullPath = @tmpPath + '/category/' + name + '.html.md'
			# 		logger.log 'info', 'Generated category: ' + fileFullPath
			# 		content = """
			# 							---
			# 							layout: category
			# 							category: #{name}
			# 							title: Category #{name}
			# 							---"""
			# 		fs.writeFile fileFullPath, content, (err) ->
			# 			logger.log 'warn', err if err


			# 	# Augment Docpads documents query, this is necessary so the documents get picked up
			# 	# for rendering - maybe there is a cleaner way to this.
			# 	# Also, it should be setup somewhere else
			# 	paths = @docpad.config.documentsPaths.slice()
			# 	paths.push(@tmpPath)
			# 	@docpad.collections.documents.setQuery('isDocument', fullPath: $beginsWith: paths)
				
			# 	# Parse the tmp directory
			# 	@docpad.parseDirectory(
			# 		path: @tmpPath
			# 		createFunction: @docpad.createDocument
			# 		resultCollection: @docpad.database
			# 		next: =>
			# 			# This contextualizes everything again, maybe we can limit it to the generated files
			# 			@docpad.generateParseContextualize (err) =>
			# 				logger.log "warn", err if err?
			# 				tasks.complete()
			# 	)
