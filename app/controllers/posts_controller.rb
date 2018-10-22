class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :create, :ecommerce, :travel, :realestate, :food, :transportation, :healthcare, :finance, :games, :education, :software, :fitness, :top]
  before_filter :admin_user, only: :new



  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    if params[:search]
   @posts = Post.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

 else
   @posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
 end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end







  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.upvote_by current_user
    redirect_to :back
  end


  def ecommerce
    @posts = Post.ecommerce.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def travel
    @posts = Post.travel.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def transportation
    @posts = Post.transportation.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def realestate
    @posts = Post.realestate.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def food
    @posts = Post.food.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def finance
    @posts = Post.finance.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def healthcare
    @posts = Post.healthcare.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def games
    @posts = Post.games.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def education
    @posts = Post.education.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def entertainment
    @posts = Post.entertainment.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def software
    @posts = Post.software.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def fitness
    @posts = Post.fitness.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end


  def top
    @posts = Post.top.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:company, :description, :category, :url, :top)
    end

    def admin_user
       redirect_to(root_path) unless current_user && current_user.admin?
    end






end
