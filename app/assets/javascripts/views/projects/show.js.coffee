class ScrumMeetings.Views.ProjectShow extends Backbone.View

  template: JST['projects/show']

  render: ->
  	console.log('rendering project:')
  	console.log(@model)
  	$(@el).html(@template(project: @model))
  	this
