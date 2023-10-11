class StaticController < ApplicationController
    def home
    end

    def profile
        @user = current_user
        @area = current_user.area
        @projects = user.projects
    end
end
