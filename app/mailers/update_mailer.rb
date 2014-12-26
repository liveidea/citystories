class UpdateMailer < ActionMailer::Base
  default from: "citystories@mail.com"
  
  def update_email(user,updated_stories)
    @user = user
    @stories = Story.where(id: updated_stories)
    mail(to: @user.email, subject: 'You have updates in followed stories')
  end
end
