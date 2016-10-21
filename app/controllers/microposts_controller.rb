class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :set_micropost, only: [:destroy]

  

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      flash[:success] = "Micropost created!"
    else
      flash[:error] = "Failed to create Micropost!"
    end
    redirect_to user_path(current_user)
  end


  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    redirect_to user_path(current_user)
    flash[:success] = 'Your micropost was deleted' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
