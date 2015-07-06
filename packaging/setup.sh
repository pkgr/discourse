#!/bin/sh
set -e

# Not everyone chooses to run discourse behind Apache or Nginx.
cat >> config/environments/production.rb <<EOF
Discourse::Application.configure do
  config.serve_static_assets = true
end
EOF

# Overwrite assets:precompile task
mv packaging/pkgr.rake lib/tasks/
