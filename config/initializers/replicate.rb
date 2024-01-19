Replicate.client.api_token = Rails.application.credentials[:replicate][:api_token]

class ReplicateWebhook
  def call(prediction)
    if prediction.succeeded?
      puts '================================================================='
      puts 'Your prediction is ready!'
      system("open #{prediction.output.first}")
      puts '================================================================='
    end
  end
end

ReplicateRails.configure do |config|
  config.webhook_adapter = ReplicateWebhook.new
end
