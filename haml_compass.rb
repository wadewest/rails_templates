gem "haml", ">=3.0.25"
gem "compass", ">=0.10.6"
gem "haml-rails", :group => :development

file "config/compass.rb", <<-CODE
project_type = :rails
project_path = RAILS_ROOT if defined?(RAILS_ROOT)

http_path = "/"
css_dir = "tmp/stylesheets"
sass_dir = "app/stylesheets"
environment = Compass::AppIntergration::Rails.env

CODE

initializer "stylesheets.rb", <<-CODE
require 'fileutils'
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))
Sass::Plugin.on_updating_stylesheet do |template, css|
	puts "Compiling \#{template} to \#{css}"
end

Rails.configuration.middleware.insert_before("Rack::Sendfile", "Rack::Static",
	:urls => ['/stylesheets'], :root => "\#{Rails.root}/tmp")

CODE

file "app/stylesheets/application.scss", <<-CODE
body h1 {
	text-size: 20px;
}

CODE

inject_into_file "config/application.rb", :after => "config.generators do |g|\n" do
  "      g.template_engine :haml\n"
end

git :add => "config/application.rb"
git :add => "config/compass.rb"
git :add => "config/initializers/stylesheets.rb"
git :add => "Gemfile"
git :commit => "-m 'Installed haml and compass, and configured it to work with Heroku.'"
