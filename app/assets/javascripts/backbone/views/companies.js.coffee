class App.Views.Companies extends Backbone.View

  el: '#content'
  template : JST['backbone/templates/company']

  events:
    'click #delete-button' : 'delete'

  initialize: (id) ->
    self = @
    @log('Fetching "' + id + '" ...')
    @model = new App.Models.Companies(id: id)
    @model.fetch(
      success: (model) ->
        self.log('Success fetching "' + id + '"')
        self.render()
        window.f = model
    )

  render: ->
    document.title = 'companies > ' + @model.get('name')
    $(@el).html(@template(model: @model.toJSON()))

  delete: ->
    @model.destroy(
      success: ->
        window.history.back()
    )

  log: (msg) ->
    console.log('View (companies): ' + msg)




