# Preview all emails at http://localhost:3000/rails/mailers/extinguisher_mailer
class ExtinguisherMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/extinguisher_mailer/alert
  def alert
    ExtinguisherMailer.alert
  end

end
