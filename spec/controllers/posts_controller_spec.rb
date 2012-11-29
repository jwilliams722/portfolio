require 'spec_helper'

describe PostsController do

  def valid_attributes
    {:title => "Test", :content => "lorem ipsum"}
  end

  # GET /posts -> PostsController#index
  describe "GET to index" do

    let!(:posts) { Post.create(valid_attributes) }
    before { get :index }

    it "should assign entry to entries" do
      assigns(:posts).should == ([post])
    end

  end

  # GET /posts/:id -> PostsController#show
  describe "GET to show" do

    let!(:posts) { Post.create(valid_attributes) }

    before { get :show, :id => post.id }

    it "should assign entry to entry" do
      assigns(:posts).should == post
    end

  end

  describe "GET to edit" do

    let(:posts) { Post.create(valid_attributes) }

    before do
      get :edit, :id => post.id
    end

    it "should assign entry to entry" do
      assigns(:posts).should == post
    end

  end

end
