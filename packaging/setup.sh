#!/bin/sh
set -e

echo "env"
env

# Not everyone chooses to run discourse behind Apache or Nginx.
cat >> config/environments/production.rb <<EOF
Discourse::Application.configure do
  config.serve_static_assets = true
end
EOF

echo 'ruby "2.4.1"' >> Gemfile

# Overwrite assets:precompile task
# mv packaging/pkgr.rake lib/tasks/
