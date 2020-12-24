class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :bio]

  def invite_member
    user = User.find(params[:user_id])
    if BandMember.create(user_id: params[:user_id], band_id: params[:band_id], status: "pending")
      redirect_to user, notice: "Invite sent."
    else
      redirect_to user, notice: "Something went wrong, please try again later."
    end
  end

  def invites
  end

  def accept_invite
    invite = BandMember.find(params[:id])
    invite.status = "Accepted"
    if invite.save
      redirect_to invite.band, notice: "You've joined #{invite.band.name}."
    else
      redirect_to invites_path, notice: "An error occured, please try again later."
    end
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    if user_is_logged_in
      redirect_to users_path, notice: "You can't create an account because you're already logged in to your account."
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
    if params[:id] == current_user_id
    else
      redirect_to users_url, notice: "You can only edit your own profile."
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  # PATCH/PUT /users/1
  def update

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end

  end

  def bio
  end

  # DELETE /users/1
  def destroy
    if params[:id] == current_user_id
      session[:user_id] = nil
      @user.destroy
      redirect_to users_url, notice: 'You deleted your account.'
    else
      redirect_to users_url, notice: 'You can only delete your own account.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
    end

end
