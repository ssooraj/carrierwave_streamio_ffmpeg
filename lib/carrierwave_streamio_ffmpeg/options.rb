module CarrierwaveStreamioFfmpeg
  class Options

    def video_options(file, opts = {})
      opts[:resolution]    = set_file_resolution(opts, file)
      opts[:video_bitrate] = set_video_quality(opts, file)
      opts[:frame_rate] = set_video_frames(opts, file)
      opts[:audio_bitrate] = set_audio_quality(opts, file)
      opts[:threads] = 8
      format = opts[:format]
      opts = opts.except(:quality, :preserve_aspect_ratio, :format)
      opts.merge!(codec(format))
    end

    def set_video_frames(opts, file)
      case opts[:quality]
        when :low
          25
        when :med
          30
        when :high
          60
        else
          file.frame_rate
      end
    end

    def set_audio_quality(opts, file)
      case opts[:quality]
        when :low
          96
        when :med
          128
        when :high
          256
        else
          (file.audio_bitrate)/100
      end
    end

    def set_video_quality(opts, file)
      case opts[:quality]
        when :low
          1250
        when :med
          5000
        when :high
          15000
        else
          (file.video_bitrate)/100
      end
    end

    def set_file_resolution(opts, file)
      case opts[:resolution]
        when :p240
          '352 x 240'
        when :p360
          '480 x 360'
        when :p480
          '858 x 480'
        when :p720
          '1280 x 720'
        when :p1080
          '1920 x 1080'
        when :p2160
          '3860 x 2160'
        else
          file.resolution
      end
    end

    def codec(format)
      case format
        when :mp4
          { video_codec: 'libx264',
            audio_codec: 'libvo_aacenc' }
        when :webm
          { video_codec: 'libvpx',
            audio_codec: 'libvorbis' }
        when :ogv
          { video_codec: 'libtheora',
            audio_codec: 'libvorbis' }
        else
          { video_codec: 'libx264',
            audio_codec: 'libvo_aacenc' }
      end
    end

    def file_type(format)
      case format
        when :mp4
          'mp4'
        when :webm
          '.webm'
        when :ogv
          '.ogv'
        else
          '.mp4'
      end
    end

    def transcoder_options(preserve_aspect_ratio)
      if preserve_aspect_ratio
        { preserve_aspect_ratio: preserve_aspect_ratio }
      else
        { preserve_aspect_ratio: :height }
      end
    end
  end
end