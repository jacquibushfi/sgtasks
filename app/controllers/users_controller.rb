class UsersController < ApplicationController

  get '/signup' do
    if !current_user
      erb :'users/signup'
    else
      redirect to '/tasks'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:name => params[:username], :password_digest => params[:password])
      session[:user_id] = @user.id 
      redirect '/tasks'
    end
  end

end