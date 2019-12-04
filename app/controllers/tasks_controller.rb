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
        @task = current_user.tasks.build(params)
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
    if @task && @task.user_id = current_user.id
      erb :'tasks/edit'
    else
      redirect to '/tasks'
    end
  end

  patch '/tasks/:id' do
    redirect_if_not_logged_in
    if params[:task] == ""
      redirect to "/tasks/#{params[:id]}/edit"
    else
      @task = Task.find_by_id(params[:id])
      if @task && @task.user_id == current_user.id
        if @task.update(date_worked: params[:date_worked], task: params[:task], project_title: params[:project_title], hrs_worked: params[:hrs_worked])
          erb :'tasks/show'
        else
          redirect to "/tasks/#{params[:id]}/edit"
        end
      else
        redirect to '/tasks'
      end
    end   
  end

  delete '/tasks/:id/delete' do
    redirect_if_not_logged_in
    @task = Task.find_by_id(params[:id])
    if @task && @task.user_id == current_user.id
      @task.delete
    end
    redirect to '/tasks'
  end

end