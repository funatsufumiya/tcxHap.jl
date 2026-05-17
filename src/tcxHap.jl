module tcxHap
  using CxxWrap
  using tcxHap_prebuilt_jll

  function get_tmp_lib()
    # WORKAROUND to avoid error on dll loading
    tmp_dir = normpath(joinpath(@__DIR__, "..", "tmp"))
    # rm(tmp_dir, force=true, recursive=true)
    if !isdir(tmp_dir)
      mkdir(tmp_dir)
    end
    lib_path = tcxHap_prebuilt_jll.get_lib_path()
    lib_name = basename(lib_path)
    cp(lib_path, normpath(joinpath(tmp_dir, lib_name)), force=true);
    return normpath(joinpath(tmp_dir, lib_name))
  end

  # @wrapmodule(() -> tcxHap_prebuilt_jll.get_lib_path())
  @wrapmodule(() -> get_tmp_lib())

  function __init__()
    @initcxx
  end

  export HapPlayer, HapFormat,
    getDecodeTimeMs,
    getChunkCount,
    resetStats,
    getHapFormat,
    setSpeed,
    load,
    close,
    isLoaded,
    play,
    stop,
    setPaused,
    togglePause,
    update,
    isPlaying,
    isPaused,
    isFrameNew,
    isDone,
    getWidth,
    getHeight,
    getDuration,
    getPosition,
    setPosition,
    getCurrentTime,
    setCurrentTime,
    getVolume,
    setVolume,
    getSpeed,
    setSpeed,
    setPan,
    getPan,
    setLoop,
    isLoop,
    draw,
    hasTexture,
    getCurrentFrame,
    getTotalFrames,
    setFrame,
    nextFrame,
    previousFrame,
    getPixels,
    hasAudio,
    getAudioCodec,
    getAudioData,
    getAudioSampleRate,
    getAudioChannels,
    isUsingHwAccel,
    getHwAccelName,
    setResyncThreshold,
    getResyncThreshold,
    getTexturePtr,
    HapPlayer_isHapFile

end # module tcxHap
