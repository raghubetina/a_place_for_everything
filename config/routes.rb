Rails.application.routes.draw do
  # get("/")

  root "things#index"

  # Routes for the Thing resource:

  # CREATE
  post("/insert_thing", { :controller => "things", :action => "create" })
          
  # READ
  get("/things", { :controller => "things", :action => "index" })
  
  get("/things/:path_id", { :controller => "things", :action => "show" })
  
  # UPDATE
  
  post("/modify_thing/:path_id", { :controller => "things", :action => "update" })
  
  # DELETE
  get("/delete_thing/:path_id", { :controller => "things", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
