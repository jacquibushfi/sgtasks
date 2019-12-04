class UsersController < ApplicationController

  get '/signup' do
    if !current_user
      erb :'users/signup'
    else
      redirect to '/tasks'
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:password] == ""
      redirect to '/signup'
    else
       if !User.find_by(name: params[:name])
         @user = User.create(:name => params[:name], :email => params[:email], :password_digest => params[:password])
       session[:user_id] = @user.id 
       redirect '/tasks'
       else
        redirect to '/signup'
       end
    end
  end

end