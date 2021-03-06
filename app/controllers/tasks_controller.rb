class TasksController < ApplicationController

  get '/tasks' do
    redirect_if_not_logged_in
    @tasks = current_user.tasks
    erb :'tasks/index'
  end

  get '/tasks/new' do
    redirect_if_not_logged_in
    erb :'tasks/newtask'
  end

  post '/tasks/new' do   
    redirect_if_not_logged_in

      if params[:task] == ""
        redirect to "/tasks/new"
      else
        @task = current_user.tasks.build(params)
        if @task.save
          redirect to "/tasks/#{@task.id}"
        else
          redirect to "/tasks/new"
        end
      end
  end

  get '/tasks/:id' do
    redirect_if_not_logged_in
      @task = current_user.tasks.find_by_id(params[:id])
      if @task 
        erb :'tasks/show'
      else
        redirect '/tasks'
      end
  end

  get '/tasks/:id/edit' do
    redirect_if_not_logged_in
    @task = current_user.tasks.find_by_id(params[:id])
    if @task 
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
      @task = current_user.tasks.find_by_id(params[:id])
      if @task 
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
    @task = current_user.tasks.find_by_id(params[:id])
    if @task 
      @task.delete
    end
    redirect to '/tasks'
  end

end