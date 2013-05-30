class App.Models.Employees extends Backbone.Model

  defaults:
    id : ''
    name: ''

  url: ->
    '/api/employees/' + @get('id')
