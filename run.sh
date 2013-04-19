#!/bin/sh
gem build slick-build.gemspec
gem install ./slick-build-0.0.1.gem

#gem contents slick-build

slick-build
