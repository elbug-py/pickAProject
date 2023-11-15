class StaticController < ApplicationController
    def home
    end


    def profile
        @user = current_user
        @area = current_user.area

        if  @user.role == "teacher"
            @projects = @user.projects
        end
    end

    def postulated_projects
        @inscriptions = current_user.inscriptions
        @postulated_projects = Project.where(id: @inscriptions.map(&:project_id))
      end      

    def teachers
        @teachers = User.where(role: 'teacher')
    end

    def teacher_projects
        @teacher = User.find(params[:teacher_id])
        @teacher_projects = @teacher.projects
        respond_to do |format|
            format.html { render :teacher_projects }
            format.json { render json: @teacher_projects }
          end
    end
end
