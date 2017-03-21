set :application, "asrapi"
set :repo_url, "git@github.com:TeMoMuKo/asrapi.git"
set :branch, "try-fixing-dem-views"

set :user, "asrapi"
set :puma_threads, [2, 4]
set :puma_workers, 0
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml")
set :linked_dirs, fetch(:linked_dirs, []).push("public/uploads")
set :pty, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :ssh_options, forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

namespace :puma do
  desc "Create directories for Puma pids and sockets"
  task :make_directories do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/tmp/sockets"
      execute "mkdir -p #{shared_path}/tmp/pids"
    end
  end

  before :start, :make_directories
end

namespace :deploy do
  desc "Make sure local repository is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/try-fixing-dem-views`
        puts "WARNING: HEAD is not the same as origin/try-fixing-dem-views"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc "Initial deployment"
  task :initial do
    on roles(:app) do
      before "deploy:restart", "puma:start"
      invoke "deploy"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
