class NotificationsController < ApplicationController

    def index
        @notifications = Notification.all.where(user:current_user).order(created_at: :desc)


    end




end
