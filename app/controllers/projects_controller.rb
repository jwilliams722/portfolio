class ProjectsController < ApplicationController

  def index
    @projects = Project.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @projects }
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project}
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:projects])
        format.html { redirect_to admin_project_path(@project,
                                                     :notice => 'Project was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors,
                             :status => :unprocessable_entity }
      end
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project }
    end
  end

  def create
    @project = Project.new(params[:projects])

    respond_to do |format|
      if @project.save
        format.html { redirect_to admin_project_path(@project,
                                                     :notice => 'Project was successfully added.')}
        format.json { render :json => @project,
                             :status => :created, :location => @project }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @project.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Project Deleted Successfully"
      redirect_to admin_projects_path
    else
      flash[:error] - "Project could not be deleted"
    end
  end

end


