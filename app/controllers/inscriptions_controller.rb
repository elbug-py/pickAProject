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


  private

  def inscription_params
    params.require(:inscription).permit(:status, :user_id, :project_id)
  end
end