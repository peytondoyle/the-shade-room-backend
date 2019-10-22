class RatingsController < ActionController::API

  def create
    rating = Rating.find_or_create_by(rating_params)
    render json: rating
  end

  def index
      render({json: Rating.all})
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :user_id, :dragqueen_id)
  end


end
