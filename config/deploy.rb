set :application, "shroom_hunters"
set :repo_url, "git@github.com:howlCode/shroom_hunters.git"

set :deploy_to, '/home/deploy/shroom_hunters'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"