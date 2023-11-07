class ProjectsController < ApplicationController
    
    # GET /projects
    def index
        @q = Project.ransack(params[:q])
        if current_user.teacher?
            @projects = @q.result.where(user_id: current_user.id)
            # @projects = Project.where(user_id: @current_user.id)
        else 
            @projects = @q.result


            if params[:teacher_name].present?
                teacher_name = params[:teacher_name].split
                first_name = teacher_name[0]
                last_name = teacher_name[1]
          
                if first_name.present? && last_name.present?
                    
                  @teachers = User.where("LOWER(name) LIKE :first_name AND LOWER(last_name) LIKE :last_name", first_name: "%#{first_name.downcase}%", last_name: "%#{last_name.downcase}%")
                else
                  @teachers = User.where("LOWER(name) LIKE :search OR LOWER(last_name) LIKE :search", search: "%#{teacher_name.join(' ').downcase}%")
                end
          
                @projects = @projects.where(user_id: @teachers.pluck(:id))
            end
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
            description = "Tu proyecto #{@project.title} ha sido creado!"
            Notification.create!(
                title:"Has creado un nuevo proyecto",
                description:description,
                user:@project.user,
                project:@project
                )
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
        @projects_with_teacher_info = @projects.map do |project|
          {
            id: project.id,
            title: project.title,
            description: project.description,
            teacher: {
              name: project.user.name,
              last_name: project.user.last_name
            }
          }
        end
      
        respond_to do |format|
          format.html { render :search }
          format.json { render json: @projects_with_teacher_info }
        end
    end
      
    def open
        @project = Project.find(params[:id])
        @project.update(status: :open)
        redirect_to projects_path
    end

    def close
        @project = Project.find(params[:id])
        @project.update(status: :closed)
        description = "Tu proyecto #{@project.title} ha sido cerrado!"

        Notification.create!(
                title:"Has cerrado un nuevo proyecto",
                description:description,
                user:@project.user,
                project:@project
                )

        redirect_to projects_path
    end

    def project_params
        params.require(:project).permit(:title, :description, :duration, :postulations_due_date, :is_payed, :amount, :vacancies, :user_id, :project_type, :status, :search_query)
    end
end
