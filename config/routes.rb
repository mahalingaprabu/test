OMS::Application.routes.draw do


 #anew_salary GET    /salary/:id/anew(.:format)             salary#anew
#      acreate_salary POST   /salary/:id/acreate(.:format)          salary#acreate

match '/employees/aindex' => 'employees#aindex'
match '/salary/aindex' => 'salary#aindex'
match '/salary/anew' => 'salary#anew'
match '/salary/acreate' => 'salary#acreate'
match '/salary/ashow' => 'salary#ashow'



#match 'update' => 'employees#edit', :as => :update, :via => :put
#match '/employees/:id' => 'employees#update'
=begin
resource :authentication, :controller => "authentication" do
  member do
     match :login
     get :logout
     match :set_password
     match :forgot_password
     match :reset_password
  end
=end
resource :user, :controller => "user" do
member do 
	match :login
	get :logout
	match :signup
	match :forgot_password
	match :change_password
	match :set_password
	match :welcome
	match :hidden
end
end



resources :employees, :controller => "employees" do
  member do
	#put 'update/id', :acion => :update
post :update
end
end
resources :complaint, :controller => "complaint" do
  member do
	
post :update
end
end

resources :proof, :controller => "proof" do
  member do
	
post :update
end
end

resources :deduction, :controller => "deduction" do
  member do
	
post :update
end
end



resources :salary, :controller => "salary" do
  member do
	
post :update
end
end




resources :department
resources :tax
resources :investment




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'authentication#login' , :as => :home

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
