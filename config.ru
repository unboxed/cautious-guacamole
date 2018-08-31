require 'rack'

run proc { |env|
  query = env["QUERY_STRING"]
  params = Hash[query.split('&').map { |pair| pair.split('=') }]
  pr = params.fetch('state', '').gsub(/[^\d]/, '')
  location = "#{ENV['PREFIX']}#{pr}.herokuapp.com#{env['REQUEST_PATH']}?#{query}"
  [302, { 'Location' => location }, []]
}
