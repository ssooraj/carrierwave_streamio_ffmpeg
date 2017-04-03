# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave_streamio_ffmpeg/version'

Gem::Specification.new do |spec|
  spec.name          = 'carrierwave_streamio_ffmpeg'
  spec.version       = CarrierwaveStreamioFfmpeg::VERSION
  spec.authors       = ['ssooraj']
  spec.email         = ['ssooraj7@gmail.com']

  spec.summary       = 'Carrierwave Video Processor using Streamio FFmpeg.'
  spec.description   = 'Generates a various versions for carrierwave uploaded videos,
                        versions can be generated giving options for quality, resolution, format, etc.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'carrierwave', '~> 1.0'
  spec.add_dependency 'streamio-ffmpeg', '~> 3.0', '>= 3.0.2'

  spec.add_development_dependency 'bundler', '~> 1.14', '>= 1.14.6'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
