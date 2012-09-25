class ScrumMeetings.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']
  tagName: "aside"
  events:
    "click a.project"            : "openProject"
    "click #add-project"   : "showProjectForm"

  initialize: ->
  	@collection.on('reset', @render, this)

  render: ->
  	$(@el).html(@template(projects: @collection))
  	this

  openProject: (e) ->
    project = @collection.get_by_id($(e.target).data("id"))
    projectView = new ScrumMeetings.Views.ProjectShow(model: project)
    SMApp.main.show(projectView)

  showProjectForm: ->
    console.log('opening form')
    projectForm = new ScrumMeetings.Views.ProjectForm(collection: @collection)
    console.log('form view')
    console.log(projectForm)
    SMApp.main.show(projectForm)