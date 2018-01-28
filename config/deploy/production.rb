# Replace 127.0.0.1 with your server's IP address!
#server '178.62.11.106', user: 'deploy', roles: :app
server '178.62.11.106', roles: %w(app web db), primary: true, user: 'deploy'

