class ProjectsController < ApplicationController
    
    # GET /projects
    def index
        @projects = Project.all
    end

    # GET /projects/:id
    def show
    end

    # GET /projects/new
    def new
        @project = Project.new
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

    def project_params
        params.require(:project).permit(:title, :description, :duration, :postulations_due_date, :is_payed, :amount, :vacancies, :user_id)
    end
end
