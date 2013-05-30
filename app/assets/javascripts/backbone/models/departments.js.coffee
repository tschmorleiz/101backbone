class App.Models.Departments extends Backbone.Model

  defaults:
    id : ''
    name: ''

  url: ->
    '/api/departments/' + @get('id')
