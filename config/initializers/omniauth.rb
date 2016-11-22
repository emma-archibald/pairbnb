Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1792828217602065', '664b12b9c31dd8d6d224321db8205908'
  end
