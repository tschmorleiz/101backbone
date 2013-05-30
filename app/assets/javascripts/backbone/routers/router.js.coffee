class App.Routers.Router extends Backbone.Router
  routes:
    'companies/:name' : 'companies'
    'departments/:name' : 'departments'
    'employees/:name' : 'employees'
    '*actions' : 'root'


  companies: (name) ->
    console.log('Router: companies > ' + name)
    new App.Views.Companies(name)

  departments: (name) ->
    console.log('Router: departments > ' + name)
    new App.Views.Departments(name)

  employees: (name) ->
    console.log('Router: employees > ' + name)
    new App.Views.Employees(name)

  root: () ->
    console.log('Loaded.')

