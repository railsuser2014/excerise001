class Backend::PostsController < Backend::BackendController
  
   before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  
  def index
    #raise params[:page].inspect
    @current_page = params[:page].present? ? (params[:page].to_i+1) : 1
    @page_limit = 10
    page_off = params[:page].present? ? params[:page].to_i : 1
    @page_off_set = (@current_page - 1) * @page_limit  # 2-1 =1 *10 10 
    logger.debug params[:page]
    if params[:search].present?
      #raise params[:search].inspect
      @posts = Post.where(['title LIKE ? ', "%#{params[:search]}%"])
    elsif params[:page].present?
      @posts = Post.where(:published => true).limit(@page_limit).offset(@page_offset)
    else
      @posts = Post.all # to retrive all the post
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
        format.html { redirect_to backend_post_path(@post), notice: 'Post was successfully created.' }
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
        format.html { redirect_to backend_post_path, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to backend_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :published)
    end
end
