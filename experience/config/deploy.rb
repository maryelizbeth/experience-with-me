# require "bundler/capistrano"
# server "50.116.38.51", :web, :app, :db, primary: true 

# set :application, "experiencewith.me"
# set :user, "deployer"
# set :deploy_to, "/home/#{user}/apps/#{application}"
# set :deploy_via, :remote_cache
# set :use_sudo, false

# set :scm, 'git'
# set :repository,  "git@github.com:maryelizbeth/experience-with-me.git"
# set :branch, "master"

# default_run_options[:pty] = true
# ssh_options[:forward_agent] = true

# namespace :deploy do 
#   %w[start stop restart].each do |command|
#     desc "#{command} unicorn server"
#     task command, roles: :app, except: {no_release: true} do
#       run "/etc/init.d/unicorn_#{application} #{command}"
#     end
#   end

#   task :setup_config, roles: :app do 
#     sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
#     sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
#     run "mkdir -p #{shared_path}/config"
#     put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
#   end 

# after "deploy:restart", "deploy:cleanup"
# end

# namespace :nginx do
#   task :setup do
#     template "nginx_unicorn.erb", "/tmp/nginx_conf" 
#     run "#{sudo} mv /tmp/nginx_conf /etc/nginx/sites-enabled/#{application}"
#   end
#   after "deploy:setup", "nginx:setup"
# end
