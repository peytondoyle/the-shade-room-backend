class DragqueensController < ActionController::API

  def index
      render({json: Dragqueen.all})
  end

end
