class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find params[:id]
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created!'
    else
      render action: 'new'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :technologies_used)
    end
end
