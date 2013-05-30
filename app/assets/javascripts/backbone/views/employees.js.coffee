class App.Views.Employees extends Backbone.View

  el: '#content'
  template : JST['backbone/templates/employee']

  events:
    'click #delete-button' : 'delete'
    'click #save-button' : 'save'
    'click #kids .kidsButton' : 'deleteKid'

  initialize: (id) ->
    self = @
    @log('Fetching "' + id + '" ...')
    @model = new App.Models.Employees(id: id)
    @model.fetch(
      success: (model) ->
        self.log('Success fetching "' + id + '"')
        self.render()
    )

  render: ->
    console.log(@model.toJSON())
    document.title = 'employee > ' + @model.get('name')
    $(@el).html(@template(model: @model.toJSON()))

  delete: ->
    @model.destroy(
      success: ->
        window.history.back()
    )

  deleteKid: (a,b,c)->
      $el = $(a.currentTarget)
      name = $el.text()
      $el.remove()
      index = @model.get('kids').indexOf(name)
      @model.get('kids').splice(index,1)
      console.log(@model.toJSON())
      @model.save()

  save: ->
    console.log(@model.toJSON())
    @model.save({
      name: $('#nameInput').val()
      address: $('#addressInput').val()
      salary: $('#salaryInput').val()
    })

  log: (msg) ->
    console.log('View (employees): ' + msg)




