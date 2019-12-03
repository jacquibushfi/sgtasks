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
      session[:user_id] = user.user_idredirect "/tasks"
    else
      redirect to '/signup'
    end
  end

end