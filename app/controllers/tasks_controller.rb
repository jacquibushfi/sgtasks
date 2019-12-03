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
    if logged_in?
      if params[:task] = ""
        redirect to '/newtask'
      else
        @task = current_user.tasks.build(date_worked: params[:date_worked], task: params[:task], project_title: params[:project_title], hrs_worked: params[:hrs_worked])
        if @task.save
          redirect to '/tasks/#{@task.id}'
        else
          redirect to '/newtask'
        end
      end
    else
      redirect to '/login'
    end
  
  end

end