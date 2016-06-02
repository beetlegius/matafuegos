task send_alerts: :environment do
  ExtinguisherMailer.alert.deliver_later if Extinguisher.expiring.any?
end
