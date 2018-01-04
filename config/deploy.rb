set :application, "sabias_que"
set :repo_url, "https://github.com/eduardogpg/sabias_que.git"

set :deploy_to, '/home/deploy/my_app_name'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"