class RatingsController < ActionController::API

  def create
    # byebug
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
    # byebug
    originalrating = Rating.find(params[:id])
    editRating = originalrating.update(rating_params)
    newrating = Rating.find(params[:id])
    render json: newrating
  end

  def ratingsByUser
    user = User.find(params[:id])
    rating = Rating.where(user_id: user)
    render json: rating
  end

  def getAllQueenRatings
    queen = Dragqueen.find(params[:id])
    rating = Rating.where(dragqueen_id: queen)
    render json: rating
  end

  private

  def rating_params
    params.permit(:rating, :user_id, :dragqueen_id, :id)
  end


end
