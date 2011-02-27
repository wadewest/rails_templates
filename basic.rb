run "rm public/index.html"

git :init
git :add => '.'
git :commit => "-a -m 'Initial commit'"

apply "https://github.com/wadewest/rails_templates/raw/master/haml_compass.rb"

run "bundle install"
