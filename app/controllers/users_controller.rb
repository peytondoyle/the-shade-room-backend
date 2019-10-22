class UsersController < ActionController::API

  def create
    user = User.find_or_create_by(user_params)
    render json: user
  end

  def index
    render({json: User.all})
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
