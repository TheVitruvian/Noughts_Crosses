class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.won = 0
    @user.lost = 0
    @user.drew = 0

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "You're alive!"
      else
        render action: "new"
      end
  end

  def show
    @user = User.find params[:id]
    
    page = params[:page] || 1
    per_page = 10
    @games = @user.users_games.paginate(page: page, per_page: per_page).order('created_at DESC').all
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'You was successfully updated. Fo Sho.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
