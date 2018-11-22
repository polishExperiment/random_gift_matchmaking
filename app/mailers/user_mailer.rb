class UserMailer < ApplicationMailer
  default from: 'p.zwolin@gmail.com'

  def send_drawn email, person
    mail(to: email, subject: person)
  end
end
