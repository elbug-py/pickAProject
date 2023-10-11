class StaticController < ApplicationController
    def home
    end

    def teachers
        @teachers = User.where(role: 'teacher')
    end
end
