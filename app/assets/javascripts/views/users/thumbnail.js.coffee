class ScrumMeetings.Views.Thumbnail extends Backbone.View

  template: JST['users/thumbnail']

  render: ->
  	console.log('model')
  	console.log(@model)
  	$(@el).html(@template(user: @model))
  	this
