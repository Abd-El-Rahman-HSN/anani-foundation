Rails.application.routes.draw do
  resources :receive_groups
  resources :send_groups
  resources :reductions
  resources :extras
  resources :expenses
  resources :workshop_salaries
  devise_for :users, controllers: { invitations: 'users/invitations' }
  resources :users
  resources :warehouse_transactions
  resources :request_materials
  resources :production_phases
  resources :job_orders do 
    resources :request_materials
  end

  get 'home/home'

  # get 'invoice_payment_scheduels/index'

  # get 'invoice_payment_scheduels/new'

  # get 'invoice_payment_scheduels/create'

  # get 'invoice_payment_scheduels/edit'

  # get 'invoice_payment_scheduels/update'

  # get 'invoice_payment_scheduels/destroy'

  # get 'invoices/index'

  # get 'invoices/new'

  # get 'invoices/create'

  # get 'invoices/edit'

  # get 'invoices/update'

  # get 'invoices/destroy'

  # get 'job_orders/index'

  # get 'job_orders/new'

  # get 'job_orders/create'

  # get 'job_orders/edit'

  # get 'job_orders/update'

  # get 'job_orders/destroy'

  # get 'daily_production_input/index'

  # get 'daily_production_input/new'

  # get 'daily_production_input/create'

  # get 'daily_production_input/edit'

  # get 'daily_production_input/update'

  # get 'daily_production_input/destroy'

  # get 'raw_material_warehouse/index'

  # get 'raw_material_warehouse/new'

  # get 'raw_material_warehouse/create'

  # get 'raw_material_warehouse/edit'

  # get 'raw_material_warehouse/update'

  # get 'raw_material_warehouse/destroy'

  # get 'categories/index'

  # get 'categories/new'

  # get 'categories/create'

  # get 'categories/edit'

  # get 'categories/update'

  # get 'categories/destroy'

  # get 'carpet_data/index'

  # get 'carpet_data/new'

  # get 'carpet_data/create'

  # get 'carpet_data/edit'

  # get 'carpet_data/update'

  # get 'carpet_data/destroy'

  # get 'suppliers/index'

  # get 'suppliers/new'

  # get 'suppliers/create'

  # get 'suppliers/edit'

  # get 'suppliers/update'

  # get 'suppliers/destroy'

  # get 'workshops/index'

  # get 'workshops/new'

  # get 'workshops/create'

  # get 'workshops/edit'

  # get 'workshops/update'

  # get 'workshops/destroy'

  # get 'looms/index'

  # get 'looms/new'

  # get 'looms/create'

  # get 'looms/edit'

  # get 'looms/update'

  # get 'looms/destroy'

  # get 'workers/index'

  # get 'workers/new'

  # get 'workers/create'

  # get 'workers/edit'

  # get 'workers/update'

  # get 'workers/destroy'

  # get 'locations/index'

  # get 'locations/new'

  # get 'locations/create'

  # get 'locations/edit'

  # get 'locations/update'

  # get 'locations/destroy'

  # get 'showrooms/index'

  # get 'showrooms/new'

  # get 'showrooms/create'

  # get 'showrooms/edit'

  # get 'showrooms/update'

  # get 'showrooms/destroy'
  resources :showrooms,:locations, :workshops,:looms,:carpet_data,:categories,:invoices,:raw_material_warehouses,:workers,:suppliers,:main_designes,
            :invoice_payment_scheduels,:daily_production_inputs  
    root "home#home"
    # root "locations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
