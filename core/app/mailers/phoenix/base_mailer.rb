#require "resque"
module Phoenix
  class BaseMailer < ActionMailer::Base
    #include Resque::Mailer

    #default :sender => Setting.email_sender
    #helper :application,:users
    #layout "mailer"
  end
end