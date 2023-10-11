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
end
