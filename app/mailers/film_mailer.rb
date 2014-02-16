class FilmMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.film_mailer.new.subject
  #
  def new(photo, user)
    @photo=photo
    @user=user
    @greeting = "Hi"

    mail to: user.email, subject:"New photo",
    from:"from@live-idea.org"
  end
end
