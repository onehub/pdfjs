module Pdfjs
  class Engine < Rails::Engine
    initializer "pdfjs.assets.precompile" do |app|
      app.config.assets.precompile += [%r{.*pdfjs.*\..*}]
    end
  end
end
