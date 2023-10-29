class ProjectsController < ApplicationController
    
    # GET /projects
    def index
        if current_user.teacher?
            @projects = Project.where(user_id: @current_user.id)
        else 
            @projects = Project.all
        end
    end

    # GET /projects/:id
    def show
        @project = Project.find(params[:id])
        @project_inscriptions = @project.inscriptions
        @areas = Area.all
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
        if current_user.role=='teacher' or current_user.role =='admin'
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

    def search_projects
        @projects = Project.all
        respond_to do |format|
          format.html {render :search}
          format.json { render json: @projects}
        end
    end

    def open
        @project = Project.find(params[:id])
        @project.update(status: :open)
        redirect_to @project
    end

    def close
        @project = Project.find(params[:id])
        @project.update(status: :closed)
        redirect_to @project
    end

    def project_params
        params.require(:project).permit(:title, :description, :duration, :postulations_due_date, :is_payed, :amount, :vacancies, :user_id, :project_type, :status)
    end
end
