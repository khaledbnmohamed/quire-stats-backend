# config/initializers/carrierwave.rb

if Rails.env.test? || Rails.env.cucumber?

  # Autoload uploaders
  Dir["#{Rails.root}/app/uploaders/*_uploader.rb"].each { |file| require file }

  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # Use different directory for testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?

    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        model_class = model.class.try(:base_class) || model.class
        model_name = model_class.to_s.underscore
        "#{Rails.root}/spec/support/uploads/#{model_name}/#{mounted_as}/#{model.id}"
      end
    end
  end
else

  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                            # required
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),            # required
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),            # required
      region:                'us-east-1'                       # to match the carrierwave and bucket region
    }
    config.fog_directory = "quire_backend"                   # required
    config.fog_public    = false
    config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
    config.storage       = :fog
    config.asset_host = ActionController::Base.asset_host
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
