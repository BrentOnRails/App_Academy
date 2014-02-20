class CatRentalRequestsController < ApplicationController


  def index
    @requests = CatRentalRequest.all
    render :index
  end

  before_action :find_request, only: [:show, :edit, :update, :destroy]


  def show
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def edit

    render :edit
  end

  def update
    if @request.update_attributes(request_all_params)
      redirect_to cat_rental_request_url(@request)
    else
      render :edit
    end
  end

  def approve
    @request.approve!
  end

  def deny
    @request.deny!
    # CatRentalRequest.delete(@request)
  end


  # def update # @post = Post.find(params[:id]) # if @post.update_attributes(post_params) # redirect_to post_url(@post) # else # flash.now[:errors] = @post.errors.full_messages # render :edit # end # end def create @cat = Cat.new(cat_all_params)

  def create
    @request = CatRentalRequest.new(request_all_params)

    if @request.save
      redirect_to cat_rental_requests_url
    else
      # flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  private
  def find_request
    @request = CatRentalRequest.find(params[:id])
  end

  def request_all_params
    # {request: {cat_id: 4, start_date: '12013', ...}}
    params.require(:request).permit(:cat_id, :start_date, :end_date, :status)
  end

end

#
# cat_rental_requests GET    /cat_rental_requests(.:format)          cat_rental_requests#index
#                         POST   /cat_rental_requests(.:format)          cat_rental_requests#create
#  new_cat_rental_request GET    /cat_rental_requests/new(.:format)      cat_rental_requests#new
# edit_cat_rental_request GET    /cat_rental_requests/:id/edit(.:format) cat_rental_requests#edit
#      cat_rental_request GET    /cat_rental_requests/:id(.:format)      cat_rental_requests#show
#                         PATCH  /cat_rental_requests/:id(.:format)      cat_rental_requests#update
#                         PUT    /cat_rental_requests/:id(.:format)      cat_rental_requests#update
#                         DELETE /cat_rental_requests/:id(.:format)      cat_rental_requests#destroy
