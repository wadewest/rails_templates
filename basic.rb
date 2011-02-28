run "rm public/index.html"

git :init
git :add => '.'
git :commit => "-a -m 'Initial commit'"

inject_into_class "config/application.rb", "Application", <<-CODE
    config.generators do |g|
    end

CODE

apply "https://github.com/wadewest/rails_templates/raw/master/haml_compass.rb"

run "bundle install"
