class ImagesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def show
      @image = Image.find(params[:id])
      @comments = @image.comments.paginate(page: params[:page])
      @comment = @image.comments.build if logged_in?
    end

    def create
        @images = current_user.images.build(photo_params)
        if @images.save
            render :partial => 'shared/feed'
        else
            #flash[:danger] = 'Upload error!'
            redirect_to root_url, data: {alert: 'Upload error'}
        end
    end

    def destroy
        @images.destroy
        flash.now[:success] = 'Image deleted'
        redirect_to request.referrer || root_url
    end

    private

    def photo_params
        params.require(:image).permit(:photo, :title)
    end

    def correct_user
        @images = current_user.images.find_by(id: params[:id])
        redirect_to root_url if @images.nil?
      end
end
