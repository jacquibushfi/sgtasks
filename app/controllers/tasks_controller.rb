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
    redirect to '/tasks'
  end

  get '/tasks/:id' do
    redirect_if_not_logged_in
      @task = Task.find_by_id(params[:id])
      erb :'tasks/show'
  end

  get '/tasks/:id/edit' do
    redirect_if_not_logged_in
    @task = Task.find_by_id(params[:id])
    erb :'tasks/edit'
  end

  patch '/tasks/:id' do
    redirect_if_not_logged_in
    @task = Task.find_by_id(params[:id])
    @task.update(date_worked: params[:date_worked], task: params[:task], project_title: params[:project_title], hrs_worked: params[:hrs_worked])
    @task.save
    redirect to '/tasks'
  end

  

  

  
end