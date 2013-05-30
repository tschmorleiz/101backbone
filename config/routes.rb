BackboneJS::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

# route for index page
root :to => 'home#index'
match 'reset' => 'home#reset'

match 'total' => 'companies#total'

scope 'api' do
  scope 'employees' do
    get ':_id' => 'employees#get'
    delete ':_id' => 'employees#delete'
    put ':_id' => 'employees#update'
  end

  scope 'departments' do
    get ':_id' => 'departments#get'
    delete ':_id' => 'departments#delete'
    put ':_id' => 'departments#update'
  end

  scope 'companies' do
    get ':_id' => 'companies#get'
    delete ':_id' => 'companies#delete'
    put ':_id' => 'companies#update'
  end
end

end
