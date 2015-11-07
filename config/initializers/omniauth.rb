Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.secrets.google_client_id,
    Rails.application.secrets.google_client_secret, {
      name: 'google',
      image_aspect_ratio: 'square',
      hd: Rails.application.secrets.google_hosted_domain,
    }
end
