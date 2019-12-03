class TasksController < ApplicationController

  get '/tasks' do
    redirect_if_not_logged_in
    @tasks = Task.all 
    erb :'tasks/index'
  end

  get '/newtask' do
    redirect_if_not_logged_in
    erb :'tasks/newtask'
  end

  post '/newtask' do   
    redirect_if_not_logged_in
      Task.create(params)
      redirect "/tasks"
    end


  get '/tasks/:id' do
    redirect_if_not_logged_in
      @task = Task.find_by_id(params[:id])
      erb :'tasks/show'
  end
  
end