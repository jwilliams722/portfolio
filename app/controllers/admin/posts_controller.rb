class Admin::PostsController < Admin::BaseController

  before_filter :login_required

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.tml.erb
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_post_path(@post,
                      :notice => 'Blog post was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_path(@post,
                     :notice => 'Blog post was successfully created.')}
        format.json { render :json => @post,
                     :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post Deleted Successfully"
    redirect_to admin_posts_path
    else
      flash[:error] - "Post could not be deleted"
    end

    #respond_to do |format|
      #format.html { redirect_to posts_url }
      #format.json { head :no_content }
  end
end
