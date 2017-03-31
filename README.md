## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave_streamio_ffmpeg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave_streamio_ffmpeg

## Usage

In the Rails app/uploaders/filename.rb, call the encode function with options.
Example : 

    version :mp4 do
     version :p480 do
       process encode: [{format :mp4, resolution: :p480, quality: :low, preserve_aspect_ratio: :width}]
     end
 
     def full_filename(for_file)
       super.chomp(File.extname(super)) + '.mp4'
     end
    end
    
The options are passed as hash to this function, can be also empty.

The options are:
* format - format of the output video,  possible options are mp4, webm and ogv
* resolution - resolution if output file, possible values are p240, p360, p480, p720, p1080 and p2160
* quality - Quality of the file to be saved, possible values are low, med, and high.
* preserve_aspect_ratio - value to be preserved when correcting aspect ration, possible values :width and :height.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ssooraj/carrierwave_streamio_ffmpeg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

