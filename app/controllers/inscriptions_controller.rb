class InscriptionsController < ApplicationController

    def index
        @inscriptions = Inscription.all
    end

    def show
        @inscription = Inscription.find(params[:id])
    end

    def new
        @inscription = Inscription.new
    end

    def edit
        @inscription = Inscription.find(params[:id])
    end

    def create
        if current_user.student?
            @user = current_user
            project = Project.find(params[:project_id]) # Get the project you want to associate the inscription with
            default_status = 0 # Set your desired default status
            
            @inscription = Inscription.new(user_id: @user.id, project_id: project.id, status: default_status)

            if @inscription.save
              redirect_to inscriptions_path
              puts "Inscription createdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            else
              render 'new'
            end
        end
    end

    def destroy
        @inscription = Inscription.find(params[:id])
        @inscription.destroy
        redirect_to inscriptions_path
    end


    def accept
        @inscription = Inscription.find(params[:id])
        @project = Project.find(@inscription.project_id)
        if current_user.teacher? && @inscription.status != "approved"
          @inscription.update(status: 1)
          @project.update(vacancies: @project.vacancies - 1)
          redirect_to projects_path, notice: 'Inscription accepted.'
        else
          redirect_to projects_path, alert: 'You do not have permission to accept inscriptions.'
        end
      end
      
      def reject
        @inscription = Inscription.find(params[:id])
        @project = Project.find(@inscription.project_id)
        if current_user.teacher? && @inscription.status != "rejected"
          @inscription.update(status: 2)
            @project.update(vacancies: @project.vacancies + 1)
          redirect_to projects_path, notice: 'Inscription rejected.'
        else
          redirect_to projects_path, alert: 'You do not have permission to reject inscriptions.'
        end
      end
      
      


  private

  def inscription_params
    params.require(:inscription).permit(:status, :user_id, :project_id)
  end
end