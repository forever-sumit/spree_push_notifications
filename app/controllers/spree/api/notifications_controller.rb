module Spree   
  module Api    
    class NotificationsController < Spree::Api::BaseController
                  
      def on
        if current_api_user
          current_api_user.preferred_notification_switch = true
          current_api_user.save 
          @user = current_api_user
          respond_with(current_api_user, :status => 200, :default_template => :notification_preference)
        else
          unauthorized
        end
      end
      
      def off
        if current_api_user
          current_api_user.preferred_notification_switch = false
          current_api_user.save
          @user = current_api_user
          respond_with(current_api_user, :status => 200, :default_template => :notification_preference)
        else
          unauthorized
        end
      end
      
      def status
        if current_api_user
          @user = current_api_user
          respond_with(current_api_user, :status => 200, :default_template => :notification_preference)
        else
          unauthorized
        end
      end

      def index
        if current_api_user
          @notifications = current_api_user.user_notifications
          @user = current_api_user
          respond_with(@notifications)      
        else
          unauthorized
        end
      end
        
      def show
        load_and_authorize_notification(:read)
        respond_with(@notification)
      end
                                                                
      def read
        if current_api_user
          find_user_notification
          @notification.read
          respond_with(@notification, :status => 200, :default_template => :show)
        else
          unauthorized
        end
      end            

      def unread_count
        if current_api_user
          @unread_count = Spree::UserNotification.unread(current_api_user.id).size
          respond_with(@unread_count, :status => 200, :default_template => :unread_count)
        else
          unauthorized
        end
      end
                                                                                        
      def delete
        if current_api_user
          find_user_notification
          @notification.destroy
          respond_with(@notification, :status => 200, :default_template => :show)           
        else
          unauthorized  
        end        
      end
      
      private
        def find_user_notification
          @notification = Spree::UserNotification.find(params[:id])
        end

        def load_and_authorize_notification(permission)
          find_user_notification
          authorize! permission, @notification
        end
      
    end
  end
end
