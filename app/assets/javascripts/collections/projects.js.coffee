class ScrumMeetings.Collections.Projects extends Backbone.Collection

  model: ScrumMeetings.Models.Project
  url: '/api/projects'

  get_by_id: (id) ->
  	p = _.find( @models, (p) -> p.get('id') == id )