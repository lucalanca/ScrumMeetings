class ScrumMeetings.Routers.Projects extends Backbone.Router
	routes:
		'': 'index'
		'projects/:id': 'show'

	initialize: ->
		@collection = new ScrumMeetings.Collections.Projects()
		@collection.fetch()
 
	index: ->
		asideview = new ScrumMeetings.Views.ProjectsIndex(collection: @collection)
		mainview = new ScrumMeetings.Views.Thumbnail(
			model: new ScrumMeetings.Models.User(
				"username": "lucalanca"
				"email": "user1@users.pt"
			)
		)
		SMApp.aside.show(asideview)
		SMApp.main.show(mainview)

	show: (id) ->
		alert 'clicked yeah'