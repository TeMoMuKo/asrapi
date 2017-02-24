Apipie.configure do |config|
  config.app_name                = "ASRApp"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/api/docs"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.validate                = false
  config.default_version         = "2.0"
end
