class App.Views.Departments extends Backbone.View

  el: '#content'
  template : JST['backbone/templates/department']

  events:
    'click #delete-button' : 'delete'
    'click #save-button' : 'save'

  initialize: (id) ->
    self = @
    @log('Fetching "' + id + '" ...')
    @model = new App.Models.Departments(id: id)
    @model.fetch(
      success: (model) ->
        self.log('Success fetching "' + id + '"')
        self.render()
    )

  render: ->
    console.log(@model.toJSON())
    document.title = 'department > ' + @model.get('name')
    $(@el).html(@template(model: @model.toJSON()))

  delete: ->
    @model.destroy(
      success: ->
        window.history.back()
    )

  save: ->
    @model.save({
      name: $('#nameInput').val()
    })
    $('#titleName').text(@model.get('name'))

  log: (msg) ->
    console.log('View (departments): ' + msg)




