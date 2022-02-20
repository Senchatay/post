class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    if params.require(:post)[:image].present?
      @post = Post.new(post_params)
      @post.account_id = current_account.id if account_signed_in?
        if @post.save
          redirect_to dashboard_url, flash: { success: "Post was successfully created." }
        else
          redirect_to new_post_url, flash: { danger: "Post was not saved!" }
        end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image,:image_cache, :title, :text )
    end

end
