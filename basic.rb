run "rm public/index.html"

git :init
git :add => '.'
git :commit => "-a -m 'Initial commit'"

apply "haml_compass.rb"
