class Api::AccountController < Api::BaseController
  def get
    render json: { message: 'Hello World' }
  end

  def create

  end
end
