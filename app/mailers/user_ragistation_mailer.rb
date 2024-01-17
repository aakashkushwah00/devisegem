class UserRagistationMailer < ApplicationMailer

    default from: 'notifications@example.com'
    
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'  # Replace with the appropriate URL
        mail(to: @user.email, subject: 'Welcome to Our Hotel Management System')
    end
    
end
