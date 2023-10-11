class StaticController < ApplicationController
    def home
    end

    def profile
        @user = current_user
        @area = current_user.area

        if  @user.role == "teacher"
            @projects = @user.projects.first
        end
    end
end
