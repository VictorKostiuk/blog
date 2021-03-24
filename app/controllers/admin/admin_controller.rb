class Admin::AdminController < ApplicationController

  layout 'admin'

 before_action :authenticate_user!
 before_action :check_admin

 protected

 def check_admin
   redirect_to root_path, alert: " У вас немає прав доступу для перегляду цієї сторінки" unless current_user.admin?
 end
end