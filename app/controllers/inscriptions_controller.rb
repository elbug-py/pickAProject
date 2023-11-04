class InscriptionsController < ApplicationController

    def index
      project_id = params[:project_id]
      project = Project.find(project_id)
      @inscriptions = project.inscriptions
      response = {
        html: @inscriptions.map do |inscription|
          render_to_string(partial: 'inscription', locals: { inscription: inscription })
        end
      }
      respond_to do |format|
        format.json { render json: response }
      end
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
            # debugger
            if Inscription.where(user:@user,project:project).count != 0
              flash[:alert] = 'No te puedes re-postular'
              redirect_to projects_path 
              


            else
              @inscription.save

              flash[:notice ] = 'inscrito'
              redirect_to projects_path 
              description = "%s %s se a postulado al proyecto %s" % [current_user.name,current_user.last_name,project.title]
              Notification.create!(
                title:"Has recibido una nueva postulacion",
                description:description,
                user:project.user,
                project:project
                )
              puts "Inscription createdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
              # render 
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
        
        if current_user.teacher? or current_user.admin? && @inscription.status != "approved"
          @inscription.update(status: 1)
          @project.update(vacancies: @project.vacancies - 1)
          description = "Tu postulacion a %s fue aceptada" % [@project.title]
          Notification.create!(
            title:"Postulacion Aceptada",
            description:description,
            user:@inscription.user,
            project:@project,
            inscription_id:@inscription.id
            )
          redirect_to projects_path, notice: 'Inscription accepted.'
        else
          redirect_to projects_path, alert: 'You do not have permission to accept inscriptions.'
        end
      end
      
      def reject
        @inscription = Inscription.find(params[:id])
        @project = Project.find(@inscription.project_id)
        if current_user.teacher? or current_user.admin? && @inscription.status != "rejected"
          @inscription.update(status: 2)
          @project.update(vacancies: @project.vacancies + 1)
          description = "Tu postulacion a %s fue rechazada" % [@project.title]
          # debugger
          Notification.create!(
            title:"Postulacion Rechazada",
            description:description,
            user:@inscription.user,
            project:@project,
            inscription_id:@inscription.id
            )
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