require 'carrierwave_streamio_ffmpeg/version'
require 'carrierwave_streamio_ffmpeg/options'

module CarrierwaveStreamioFfmpeg

  def encode(opts = {})
    process encode: [ opts ]
  end

  def movie(path)
    ::FFMPEG::Movie.new path
  end

  def encode(opts = {})
    file = movie(current_path)
    preserve_aspect_ratio = opts[:preserve_aspect_ratio]
    options = CarrierwaveStreamioFfmpeg::Options.new
    tmp_path = File.join(File.dirname(current_path), "tmp_file.#{options.file_type(opts[:format])}")
    file.transcode(tmp_path,
                   options.video_options(file, opts) ,
                   options.transcoder_options(preserve_aspect_ratio))
    File.rename(tmp_path, current_path)
  end
end
