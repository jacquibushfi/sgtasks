class SessionsController < ApplicationController

  get '/login' do
    if !session[:user_id]
      erb :'sessions/login'
    else
      redirect '/tasks'
    end
  end

  post '/login' do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tasks"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/'
  end
  
end