Timezone::Lookup.config(:google) do |c|
  c.api_key = Rails.application.secrets.google_api_key
end
