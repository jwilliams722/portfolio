class PostsController < ApplicationController

  before_filter :login_required, :except => [:index, :show]

  before_filter :find_post, :except => [:index, :new]

  def index
    @posts = Post.order('created_at DESC').all
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
      if @post.update_attributes(params[:posts])
        format.html { redirect_to admin_post_path(@post,
                                                  :notice => 'Blog posts was successfully updated.') }
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
    @post = Post.new(params[:posts])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post,
                                                  :notice => 'Blog posts was successfully created.')}
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

private

def find_post
  @post = Post.find(params[:id])
end

