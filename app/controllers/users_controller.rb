class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def batch_operation
    case params[:commit]
    when "Delete"
      User.destroy(params[:users])
    when "Block"
      User.where(id: params[:users]).update_all(blocked_at: true)
    when "Unblock"
      User.where(id: params[:users]).update_all(blocked_at: nil)
    end
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end
