class CommentsController < ApplicationController
  before_action :find_comment, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_product

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @product = @comment.product
  end

  def create
    @comment = @product.comments.create(comment_params)
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.product, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy

  end

  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :product_id, :body)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

end
