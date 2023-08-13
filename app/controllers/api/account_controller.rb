class Api::AccountController < Api::BaseController
  # example:
  #   curl -X POST -H "Content-Type: application/json" -d '{"email": "john@example.com"}' http://localhost:3000/api/accounts/get
  def get
    account = Account.find_by(email: get_params[:email])
    if account.present?
      render json: { public_key: account.public_key }
    else
      render json: { public_key: EncryptMeHelper.get_random_public_key }
    end
  end

  # example:
  #   curl -X POST -H "Content-Type: application/json" -d '{"email": "john@example.com", "public_key": "data"}' http://localhost:3000/api/accounts/registration
  def registration
    ActiveRecord::Base.transaction do
      model = Registration.create(registration_params)
      unless model.valid?
        return render_error('Invalid data.')
      end
    end

    render_ok
  end

  # example:
  #   curl -X POST -H "Content-Type: application/json" -d '{"email": "john@example.com", "code": "123"}' http://localhost:3000/api/accounts/validate
  def validate
    registration = Registration.find_by(email: validation_params[:email], code: validation_params[:code])
    unless registration.present?
      return render_error('Invalid code.')
    end

    begin
      ActiveRecord::Base.transaction do
        account = Account.find_by(email: registration.email)
        unless account
          account = Account.create(email: registration.email)
        end
        account.public_key = registration.public_key
        account.updated_at = Time.now
        account.save

        registration.destroy
      end

      return render_ok
    rescue Exception => e
      return render_error('Cannot finish operation.')
    end
  end

  private

  def registration_params
    params.permit(:email, :public_key)
  end
  def validation_params
    params.permit(:email, :code)
  end

  def get_params
    params.permit(:email)
  end
end
