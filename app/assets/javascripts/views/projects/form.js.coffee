class ScrumMeetings.Views.ProjectForm extends Backbone.View

  template: JST['projects/form']
  tagName: "section"

  events:
  	"click button#form-button"	:	"addProject"

  initialize: (params) ->

  	if params and !params.hasOwnProperty("model")
  		@model = new ScrumMeetings.Models.Project()

  render: ->
  	console.log('collection')
  	console.log(@collection)
  	$(@el).html(@template())
  	this

  addProject: ->
  	console.log('adding new project to collection')
  	@collection.add({name: "Some name here"})
  	# TODO: use EventAggregator (http://davidsulc.com/blog/2012/04/22/a-simple-backbone-marionette-tutorial-part-2/)
  	# so that asideview listens to an event (model has been added to collection)
  	console.log(SMApp.aside.currentView.render())
  	console.log(@collection)