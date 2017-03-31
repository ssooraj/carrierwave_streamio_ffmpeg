require 'carrierwave_streamio_ffmpeg/version'
require 'carrierwave_streamio_ffmpeg/options'

module CarrierwaveStreamioFfmpeg

  def encode(format, opts = {})
    process encode: [ format, opts ]
  end

  def movie(path)
    ::FFMPEG::Movie.new path
  end

  def encode(format, opts = {})
    tmp_path = File.join(File.dirname(current_path), "tmp_file.#{format}")
    file = movie(current_path)
    options = CarrierwaveStreamioFfmpeg::Options.new
    file.transcode(tmp_path,
                   options.video_options(file, opts) ,
                   options.transcoder_options(opts))
    File.rename(tmp_path, current_path)
  end
end
