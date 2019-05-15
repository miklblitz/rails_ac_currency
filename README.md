# README
A Test task which i created, where i used action cable in the Rails project:

Exists page, which show currency widget: http://localhost:3003
Exists admin page, where you can change currency until pointed datatime: http://localhost:3003/admin
if time out, currency will rollback to pld value on currency widget

### how it works

* install rails 5.2.1 - for Ubuntu/Mint https://gorails.com/setup/ubuntu/16.04
* install whenever - gem that provides a clear syntax for writing and deploying cron jobs https://github.com/javan/whenever
* cd to_cloned_project_folder
* bundle install, fix errors if appears
* run command: whenever
* bundle exec rails db:reset
* bundle exec rails db:seed
* foreman start