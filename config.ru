require 'rack'

run proc { |env|
  query = env["QUERY_STRING"]
  params = Hash[query.split('&').map { |pair| pair.split('=') }]
  pr = params.fetch('state', '').gsub(/[^\d]/, '')
  location = "#{ENV['PREFIX']}#{pr}.herokuapp.com/auth/google_oauth2/callback?#{query}"
  [302, { 'Location' => location }, []]
}
