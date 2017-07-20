namespace :pkgr do
  task :precompile => ["db:migrate"] do
    puts "Running overwritten assets:precompile task..."
    task = Sprockets::Rails::Task.new(Rails.application)
    task.manifest.compile(task.assets)
  end
end

task("assets:precompile").clear.enhance ['pkgr:precompile']
