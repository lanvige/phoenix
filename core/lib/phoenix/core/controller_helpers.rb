module Phoenix
  module Core
    module ControllerHelpers
      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
      
      module InstanceMethods
        def access_forbidden
          render :text => 'Access Forbidden', :layout => true, :status => 401
        end

        # can be used in views as well as controllers.
        # e.g. <% title = 'This is a custom title for this view' %>
        attr_writer :title

      protected

        def render_404(exception = nil)
          respond_to do |type|
            type.html { render :status => :not_found, :file    => "#{::Rails.root}/public/404.html", :layout => nil}
            type.all  { render :status => :not_found, :nothing => true }
          end
        end

        # Convenience method for firing instrumentation events with the default payload hash
        def fire_event(name, extra_payload = {})
          ActiveSupport::Notifications.instrument(name, default_notification_payload.merge(extra_payload))
        end
        
        # Creates the hash that is sent as the payload for all notifications. Specific notifications will
        # add additional keys as appropriate. Override this method if you need additional data when
        # responding to a notification
        def default_notification_payload
          {:user => (respond_to?(:current_user) && current_user)}
        end
        
      private
      
        def redirect_back_or_default(default)
          redirect_to(session["user_return_to"] || default)
          session["user_return_to"] = nil
        end
      end
    end
  end
end