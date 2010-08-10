set :application, "devicehub"
set :repository,  "git://github.com/zhh/devicehub.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "222.177.210.222"                          # Your HTTP server, Apache/etc
role :app, "222.177.210.222"                          # This may be the same as your `Web` server
role :db,  "222.177.210.222", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

set :deploy_to, "/var/www/#{application}"
set :user, "zhh"
set :runner, "root"
default_run_options[:pty] = true
set :rake, "/usr/local/bin/rake"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after 'deploy:update_code', 'deploy:symlink_shared'
end

