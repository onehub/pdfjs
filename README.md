# Pdfjs

Makes pdfjs conform to the directory structure required by the Rails asset pipeline.

## Installing

Just chuck it in your Gemfile:
```
gem 'pdfjs', :git => "https://github.com/onehub/pdfjs"
```

## Updating

All assets from the pdf.js project are included. To update these assets:

1. Download the latest stable release from <http://mozilla.github.io/pdf.js/getting_started/#download>
2. Drop into the gem source directory and type the following command:

-  `rake pdfjs:clean`
-  `rake pdfjs:package SOURCE="/path/to/pdfjs/folder"`
