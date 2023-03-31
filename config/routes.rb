Rails.application.routes.draw do
  # resources :jobs, only: [:index, :create]
  # resources :applications
  # resources :users
  resources :skills, only: [:index]
  get '/hello', to: 'application#hello_world'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "employee/:id", to: "application#company_application"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/my_applications", to: "applications#my_applications"
  get "/applications", to: "users#job_applications"
  patch "/editprofile/:id", to: "users#edit"
  post "/apply", to: "job_applications#apply"

  get "/companies", to: "companies#all_companies"
  post "/new-company", to: "companies#add_new_company"
  
  # get"/searched", to: "jobs#searched"
  post "/signup", to: "users#create"
  get "/jobs", to: "jobs#index"
  # get "/employee/:id", to: "users#employee"
  get "/me/:id", to: "users#me"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/employee/:id", to: "employees#employee_applications"

  patch "/jobs/:id", to:"jobs#edit"
  delete "/job/:id", to: "jobs#destroy"
  get "/company_job_applications/:id", to: "job_applications#show_job_applications"
  get "/job_application/:id", to: "job_applications#download_resume"
  get "/employee_job/:id", to: "jobs#company_jobs"
  
  post "/skills", to: "skills#create"
  post "/jobs", to: "jobs#create"
  post "/create_skills", to: "skills#skill_array"
end
