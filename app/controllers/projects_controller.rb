class ProjectsController < ApplicationController
    
    # GET /projects
    def index
        @projects = Project.all
    end

    # GET /projects/:id
    def show
        @project = Project.find(params[:id])
    end

    # GET /projects/new
    def new
        @project = Project.new
    end

    def edit
        @project = Project.find(params[:id])
    end

    # POST /projects
    def create
        if current_user.teacher?
            @user = current_user
        end
        @project = @user.projects.new(project_params)
        if @project.save
            redirect_to projects_path
        else
            render 'new'
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to projects_path
        else
            render 'edit'
        end
    end

    def project_params
        params.require(:project).permit(:title, :description, :duration, :postulations_due_date, :is_payed, :amount, :vacancies, :user_id)
    end
end