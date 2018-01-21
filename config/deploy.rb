# config valid only for Capistrano 3.1
lock '3.9.0'

set :application, 'sabias_que'
set :repo_url, 'git@github.com:eduardogpg/sabias_que.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/azureuser/profacilito'



set :assets_roles, [:app]
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/app_environment_variables.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :bundle_binstubs, nil
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :build_go do
    on roles(:app), in: :sequence, wait: 6 do
      execute :go, "install", release_path.join('realtime/web_socket/server.go')
      execute :service, "chat-facilito","restart"
    end
  end

  task :restart_sidekiq do
    on roles(:app), in: :sequence, wait: 6 do
      execute :service, "sidekiq","restart"
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
  after :restart, :restart_sidekiq
end
