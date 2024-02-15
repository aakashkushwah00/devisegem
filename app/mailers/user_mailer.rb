class UserMailer < ApplicationMailer
    def weekly_email(user)
        @user = user
        mail(to: @user.email, subject: "Your Weekly Update")
    end
end
