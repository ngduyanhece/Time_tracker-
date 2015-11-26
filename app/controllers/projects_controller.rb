class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index 
    @projects = Project.all 
  end

  def show 
  	if(params[:slug])
      @project = Project.find_by(slug: params[:slug])
  	else
    	@project = Project.find(params[:id])
    end
    @work = Work.new 
    @work.project = @project
  end

  def new 
    @project = Project.new 
  end

  def create 
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project created"
      redirect_to @project
    else
      render 'new'
    end 
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update 
    @project = Project.find(params[:id])
    if @project.update(project_params)
      Usermailer.projectupdated_email(@project).deliver
      flash[:notice] = "Project updated"
      redirect_to @project 
    else
      render 'edit'
    end
  end
  private 
    def project_params 
      params.require(:project).permit([:name,:slug,:default_rate,:company_id])
    end
end
