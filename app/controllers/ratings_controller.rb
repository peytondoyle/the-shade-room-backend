class RatingsController < ActionController::API

  def create
    rating = Rating.create(rating_params)
    render json: rating
  end

  def show
    rating = Rating.find(params[:id])
    render json: rating
  end

  def index
      render({json: Rating.all})
  end

  def update
    rating = Rating.find(params[:id])
    editRating = rating.update(rating_params)
    render json: editRating
  end

  def ratingsByUser
    user = User.find(params[:id])
    rating = Rating.where(user_id: user)
    render json: rating
  end

  private

  def rating_params
    params.permit(:rating, :user_id, :dragqueen_id)
  end


end
