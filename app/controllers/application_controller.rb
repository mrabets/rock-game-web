class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :last_sign_in_at, if: proc { user_signed_in? }

  private

  def last_sign_in_at
    current_user.update_attribute(:last_sign_in_at, Time.current)
  end
end
