class UserMailer < ApplicationMailer
  default from: 'Random Gift Matchmaking <p.zwolin@gmail.com>'

  def send_drawn email, person
    mail(to: email, subject: person)
  end
end
