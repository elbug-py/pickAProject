class NotificationsController < ApplicationController

    def index
        @notifications = Notification.all.where(user:current_user)


    end




end
