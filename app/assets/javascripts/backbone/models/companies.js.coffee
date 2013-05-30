class App.Models.Companies extends Backbone.Model

  defaults:
    id : ''
    name: ''

  url: ->
    '/api/companies/' + @get('id')
