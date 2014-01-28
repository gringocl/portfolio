class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @project = Project.new
  end

  def show
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created!'
    else flash.now[:error] = "Project could not be saved"
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated!'
    else flash.now[:error] = "Project could not be updated."
      render action: 'edit'
    end
  end

  private
    def set_project
      @project = Project.find params[:id]
    end

    def project_params
      params.require(:project).permit(:name, :technologies_used)
    end
end
