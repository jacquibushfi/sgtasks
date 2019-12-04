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
      if params[:task] == ""
        redirect to "/newtask"
      else
        @task = current_user.tasks.build(date_worked: params[:date_worked], task: params[:task], project_title: params[:project_title], hrs_worked: params[:hrs_worked])
        if @task.save
          redirect to "/tasks/#{@task.id}"
        else
          redirect to "/newtask"
        end
      end
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
    erb :'tasks/show'
  end

  delete '/tasks/:id/delete' do
    redirect_if_not_logged_in
    @task = Task.find_by_id(params[:id])
    @task.delete
    redirect to '/tasks'
  end

end