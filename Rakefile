# This file is currently outdated, please compare folder structure of the latest PDF.js version before using this file in an upgrade

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'
require 'pathname'
require 'fileutils'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Pdfjs'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test

namespace :pdfjs do
  desc "Package the pdfjs assets"

  task :package do
    source_path  = Pathname.new(ENV['SOURCE'])
    path_prefix  = 'pdfjs'

    # Put the images in the proper location
    with_path(build_path.join('images', path_prefix, 'web/images')) do |images|
      source_images = Dir[source_path.join('web/images/*')]

      source_images.each do |image|
        log_copy(image, images)

        FileUtils.cp_r(image, images)
      end
    end

    # Cmaps?
    with_path(build_path.join('cmaps', path_prefix, 'web/cmaps')) do |cmaps|
      source_cmaps = Dir[source_path.join('web/cmaps/*')]

      source_cmaps.each do |cmap|
        log_copy(cmap, cmaps)

        FileUtils.cp_r(cmap, cmaps)
      end
    end

    # Locale
    with_path(build_path.join('locale', path_prefix, 'web/locale')) do |locale|
      source_locale = Dir[source_path.join('web/locale/*')]

      source_locale.each do |l|
        log_copy(l, locale)

        FileUtils.cp_r(l, locale)
      end
    end

    # JS
    with_path(build_path.join('javascripts', path_prefix)) do |javascripts|
      with_path(javascripts.join('web')) do |web|
        sources = Dir[source_path.join('web/*.js')]

        sources.each do |js|
          log_copy(js, web)

          FileUtils.cp(js, web)
        end
      end

      with_path(javascripts.join('build')) do |build|
        sources = Dir[source_path.join('build/*.js')]

        sources.each do |js|
          log_copy(js, build)

          FileUtils.cp(js, build)
        end
      end
    end

    # HTML
    with_path(build_path.join('html', path_prefix, 'web')) do |web|
      sources = Dir[source_path.join('web/*.html')]

      sources.each do |html|
        log_copy(html, web)

        FileUtils.cp(html, web)
      end
    end

    # CSS
    with_path(build_path.join('stylesheets', path_prefix, 'web')) do |web|
      sources = Dir[source_path.join('web/*.css')]

      sources.each do |css|
        log_copy(css, web)

        FileUtils.cp(css, web)
      end
    end
  end

  task :clean do
    puts Dir[build_path.join('*')]
    FileUtils.rm_r(Dir[build_path.join('*')])
  end

  def log_copy(source, destination)
    puts "copying #{source} to #{destination}"
  end

  def project_root
    Pathname.new(File.expand_path(File.dirname(__FILE__)))
  end

  def build_path
    project_root.join('vendor/assets')
  end

  def with_path(path, &block)
    FileUtils.mkdir_p(path)

    yield path
  end
end
