class App.Views.Companies extends Backbone.View

  el: '#content'
  template : JST['backbone/templates/company']

  events:
    'click #delete-button' : 'delete'
    'click #save-button' : 'save'

  initialize: (id) ->
    self = @
    @log('Fetching "' + id + '" ...')
    @model = new App.Models.Companies(id: id)
    @model.fetch(
      success: (model) ->
        self.log('Success fetching "' + id + '"')
        self.render()
    )

  render: ->
    document.title = 'companies > ' + @model.get('name')
    $(@el).html(@template(model: @model.toJSON()))

  delete: ->
    @model.destroy(
      success: ->
        window.location = '/reset'
    )

  save: ->
    @model.save({
      name: $('#nameInput').val()
    })
    $('#titleName').text(@model.get('name'))

  log: (msg) ->
    console.log('View (companies): ' + msg)




