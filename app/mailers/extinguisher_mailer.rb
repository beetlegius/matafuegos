class ExtinguisherMailer < ApplicationMailer

  def alert
    @extinguishers = Extinguisher.is_expiring

    mail to: "nicolas@gmail.com"
  end
end
