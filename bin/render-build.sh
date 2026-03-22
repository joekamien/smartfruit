#!/usr/bin/env bash
set -o errexit

bundle install
bundle exec rails assets:precompile

# For now, the app should always have the same data
# so reset it on every deployment.
# But if this ever becomes a real app with real user data,
# we can turn off this behavior with an environment variable.
if [ "$RESET_DB_ON_DEPLOY" = "true" ]; then
  bundle exec rails db:reset
else
  bundle exec rails db:prepare
fi
