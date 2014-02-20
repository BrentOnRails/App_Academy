class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    render :edit
  end

  def update
    if @cat.update_attributes(cat_all_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end


  # def update
#     @post = Post.find(params[:id])
#     if @post.update_attributes(post_params)
#       redirect_to post_url(@post)
#     else
#       flash.now[:errors] = @post.errors.full_messages
#       render :edit
#     end
#   end
  def create
    @cat = Cat.new(cat_all_params)

    if @cat.save
      redirect_to cats_url
    else
      # flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  private
  def find_cat
    @cat = Cat.find(params[:id])
  end

  def cat_all_params
    params.require(:cat).permit(:age, :birth_date, :color, :name, :sex)
  end
end


#   Prefix Verb   URI Pattern              Controller#Action
#     cats GET    /cats(.:format)          cats#index
#          POST   /cats(.:format)          cats#create
#  new_cat GET    /cats/new(.:format)      cats#new
# edit_cat GET    /cats/:id/edit(.:format) cats#edit
#      cat GET    /cats/:id(.:format)      cats#show
#          PATCH  /cats/:id(.:format)      cats#update
#          PUT    /cats/:id(.:format)      cats#update
#          DELETE /cats/:id(.:format)      cats#destroy