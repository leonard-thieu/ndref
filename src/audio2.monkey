'Strict

Import logger

Class Audio

    Global BEAT_TARGET_X: Int
    Global BEAT_TARGET_Y: Int

    Global bansheeEffectEnabled: Bool
    Global beatDataString: Int
    Global beatMarker: Object
    Global beatMarkerGreen: Object
    Global beatMarkerRed: Object
    Global beatTarget: Object
    Global cachedSongPosition: Int
    Global cachedSongPositionFrame: Int
    Global curSubtitle: Object
    Global debugEnablePlaceholders: Bool = True
    Global delayList: Object
    Global fadeFactor: Float
    Global fadeFrames: Int
    Global firstUpdate: Bool
    Global fixedBeatNum: Int
    Global includeVideoLatency: Bool
    Global lastBeatNum: Int
    Global lastRndSnd: Object
    Global lastSFXChannel: Int
    Global lastSoundTime: Object
    Global loadedSong: Int
    Global loadedSongHot: Int
    Global musicPitchSemitones: Int
    Global musicSpeed: Float
    Global musicTransitionStartBeat: Int
    Global necrodancerSong2Active: Bool
    Global numLoops: Int
    Global songDuration: Int
    Global songFortissimole: Int
    Global songLoops: Bool
    Global songNecrodancer: Int
    Global songPaused: Bool
    Global songRiff0: Int
    Global songRiff1: Int
    Global songRiff2: Int
    Global songRiff3: Int
    Global songRiff4: Int
    Global songShopOpen: Bool
    Global songShopkeeper: Int
    Global soundData: Object
    Global soundMap: Object
    Global startFadeFrames: Int
    Global subtitleImg: Object
    Global subtitleStartTime: Int

    Function _PlayGameSound: Void(snd: Int, ch: Int, loop: Bool, pan: Float, vol: Float, rememberMusicChannel: Int, rememberVOChannel: Int, startPaused: Bool, isMusic: Bool)
        Debug.TraceNotImplemented("Audio._PlayGameSound(Int, Int, Bool, Float, Float, Int, Int, Bool, Bool)")
    End Function

    Function _PlayGameSoundAt: Void(xVal: Int, yVal: Int, snd: Int, ch: Int, loop: Bool, fullVol: Bool, maxDist: Int, volumeMult: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio._PlayGameSoundAt(Int, Int, Int, Int, Bool, Bool, Int, Float, Int)")
    End Function

    Function _PlayGameSoundAtWithDelay: Void(xVal: Int, yVal: Int, snd: Int, delayVal: Int, ch: Int, loop: Bool, vol: Float, spd: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio._PlayGameSoundAtWithDelay(Int, Int, Int, Int, Int, Bool, Float, Float, Int)")
    End Function

    Function AdjustMusicPitch: Void(diffSemitones: Int)
        Debug.TraceNotImplemented("Audio.AdjustMusicPitch(Int)")
    End Function

    Function AdjustMusicVolume: Void()
        Debug.TraceNotImplemented("Audio.AdjustMusicVolume()")
    End Function

    Function CheckNecrodancerTransition: Void()
        Debug.TraceNotImplemented("Audio.CheckNecrodancerTransition()")
    End Function

    Function CloserToNextBeatThanPrevious: Bool()
        Debug.TraceNotImplemented("Audio.CloserToNextBeatThanPrevious()")
    End Function

    Function EndBansheeEffect: Void()
        Debug.TraceNotImplemented("Audio.EndBansheeEffect()")
    End Function

    Function FinishNecrodancerTransition: Void(necrodancer: Object)
        Debug.TraceNotImplemented("Audio.FinishNecrodancerTransition(Object)")
    End Function

    Function GeneratePlaylist: Void()
        Debug.TraceNotImplemented("Audio.GeneratePlaylist()")
    End Function

    Function GetBeatAnimFrame2: Int()
        Debug.TraceNotImplemented("Audio.GetBeatAnimFrame2()")
    End Function

    Function GetBeatAnimFrame3: Int()
        Debug.TraceNotImplemented("Audio.GetBeatAnimFrame3()")
    End Function

    Function GetBeatAnimFrame4: Int()
        Debug.TraceNotImplemented("Audio.GetBeatAnimFrame4()")
    End Function

    Function GetClosestBeatNum: Int(useFixed: Bool)
        Debug.TraceNotImplemented("Audio.GetClosestBeatNum(Bool)")
    End Function

    Function GetCurrentBeatNumber: Int(beatOffset: Int, useFixed: Bool)
        Debug.TraceNotImplemented("Audio.GetCurrentBeatNumber(Int, Bool)")
    End Function

    Function GetCurrentBeatNumberIncludingLoops: Int(beatOffset: Int, useFixed: Bool)
        Debug.TraceNotImplemented("Audio.GetCurrentBeatNumberIncludingLoops(Int, Bool)")
    End Function

    Function GetCustomMusicFolder: Int(forList: Bool)
        Debug.TraceNotImplemented("Audio.GetCustomMusicFolder(Bool)")
    End Function

    Function GetDistanceFromNearestBeat: Int()
        Debug.TraceNotImplemented("Audio.GetDistanceFromNearestBeat()")
    End Function

    Function GetDistanceFromNearestHalfBeat: Int()
        Debug.TraceNotImplemented("Audio.GetDistanceFromNearestHalfBeat()")
    End Function

    Function GetNextBeatDuration: Int()
        Debug.TraceNotImplemented("Audio.GetNextBeatDuration()")
    End Function

    Function GetNonAbsoluteDistanceFromNearestBeat: Int()
        Debug.TraceNotImplemented("Audio.GetNonAbsoluteDistanceFromNearestBeat()")
    End Function

    Function GetPercentDistanceFromNextBeat: Float()
        Debug.TraceNotImplemented("Audio.GetPercentDistanceFromNextBeat()")
    End Function

    Function GetPlaylist: Int()
        Debug.TraceNotImplemented("Audio.GetPlaylist()")
    End Function

    Function GetSongPathPrefixFromPlaylist: Int(tmpNum: Int)
        Debug.TraceNotImplemented("Audio.GetSongPathPrefixFromPlaylist(Int)")
    End Function

    Function GetSongPathSuffixFromPlaylist: Int(tmpNum: Int)
        Debug.TraceNotImplemented("Audio.GetSongPathSuffixFromPlaylist(Int)")
    End Function

    Function GetSongPosition: Int()
        Debug.TraceNotImplemented("Audio.GetSongPosition()")
    End Function

    Function GetSoundFromFilename: Int(snd: Int)
        Debug.TraceNotImplemented("Audio.GetSoundFromFilename(Int)")
    End Function

    Function HitBeat: Void(bNum: Int)
        Debug.TraceNotImplemented("Audio.HitBeat(Int)")
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Audio.Init()")
    End Function

    Function IsLastFrameOfBeat: Bool()
        Debug.TraceNotImplemented("Audio.IsLastFrameOfBeat()")
    End Function

    Function LoadSong: Bool(sName: Int, hasPrefix: Bool, suffix: Int, zoneSpecial: Int, custom: Bool, doubleTime: Bool, halfSpeed: Bool, origSongName: Int, useCustom: Bool)
        Debug.TraceNotImplemented("Audio.LoadSong(Int, Bool, Int, Int, Bool, Bool, Bool, Int, Bool)")
    End Function

    Function LoadSongForLevel: Void(lvl: Int, zone: Int, useCustom: Bool)
        Debug.TraceNotImplemented("Audio.LoadSongForLevel(Int, Int, Bool)")
    End Function

    Function LoadSongFromPlaylist: Void(tmpNum: Int)
        Debug.TraceNotImplemented("Audio.LoadSongFromPlaylist(Int)")
    End Function

    Function LoadSoundDataXML: Void()
        Debug.TraceNotImplemented("Audio.LoadSoundDataXML()")
    End Function

    Function LoadSubtitle: Void(snd: Int)
        Debug.TraceNotImplemented("Audio.LoadSubtitle(Int)")
    End Function

    Function ModifyMusicSpeed: Void(spd: Float)
        Debug.TraceNotImplemented("Audio.ModifyMusicSpeed(Float)")
    End Function

    Function PauseSong: Void(pause: Bool)
        Debug.TraceNotImplemented("Audio.PauseSong(Bool)")
    End Function

    Function PlayGameSound: Void(snd: Int, ch: Int, spd: Float)
        Debug.TraceNotImplemented("Audio.PlayGameSound(Int, Int, Float)")
    End Function

    Function PlayGameSoundAt: Void(snd: Int, xVal: Int, yVal: Int, ch: Int, fullVol: Bool, maxDist: Int, loop: Bool, spd: Float)
        Debug.TraceNotImplemented("Audio.PlayGameSoundAt(Int, Int, Int, Int, Bool, Int, Bool, Float)")
    End Function

    Function PlayGameSoundFromFile: Void(snd: Int, ch: Int, loop: Bool, pan: Float, vol: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio.PlayGameSoundFromFile(Int, Int, Bool, Float, Float, Int)")
    End Function

    Function PlayGameSoundFromFileAt: Void(xVal: Int, yVal: Int, snd: Int, ch: Int, loop: Bool, fullVol: Bool, maxDist: Int, volumeMult: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio.PlayGameSoundFromFileAt(Int, Int, Int, Int, Bool, Bool, Int, Float, Int)")
    End Function

    Function PlayGameSoundFromFileAtWithDelay: Void(xVal: Int, yVal: Int, snd: Int, delayVal: Int, ch: Int, loop: Bool, vol: Float, spd: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio.PlayGameSoundFromFileAtWithDelay(Int, Int, Int, Int, Int, Bool, Float, Float, Int)")
    End Function

    Function PlayGameSoundFromFileWithDelay: Void(snd: Int, delayVal: Int, ch: Int, loop: Bool, pan: Float, vol: Float, spd: Float, voNum: Int)
        Debug.TraceNotImplemented("Audio.PlayGameSoundFromFileWithDelay(Int, Int, Int, Bool, Float, Float, Float, Int)")
    End Function

    Function RenderBeatIndicator: Void()
        Debug.TraceNotImplemented("Audio.RenderBeatIndicator()")
    End Function

    Function RenderSubtitle: Void()
        Debug.TraceNotImplemented("Audio.RenderSubtitle()")
    End Function

    Function ResetBeatMarkers: Void(doubleTime: Bool, halfSpeed: Bool, useShrine: Bool, customMusicForConga: Bool)
        Debug.TraceNotImplemented("Audio.ResetBeatMarkers(Bool, Bool, Bool, Bool)")
    End Function

    Function SetMusicVolPercent: Void(percent: Float, tmpSongNum: Int)
        Debug.TraceNotImplemented("Audio.SetMusicVolPercent(Float, Int)")
    End Function

    Function StartBansheeEffect: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Audio.StartBansheeEffect(Int, Int)")
    End Function

    Function StartNecrodancerTransition: Void(necrodancer: Object)
        Debug.TraceNotImplemented("Audio.StartNecrodancerTransition(Object)")
    End Function

    Function StopCoralRiff: Void()
        Debug.TraceNotImplemented("Audio.StopCoralRiff()")
    End Function

    Function TimeUntilBeat: Int(beatOffset: Int)
        Debug.TraceNotImplemented("Audio.TimeUntilBeat(Int)")
    End Function

    Function TimeUntilSpecificBeat: Int(beatNum: Int)
        Debug.TraceNotImplemented("Audio.TimeUntilSpecificBeat(Int)")
    End Function

    Function ToggleSongPause: Void()
        Debug.TraceNotImplemented("Audio.ToggleSongPause()")
    End Function

    Function Update: Void(hasLoadedGameData: Bool)
        Debug.TraceNotImplemented("Audio.Update(Bool)")
    End Function

    Function UpdateCoralRiffVolume: Void(num1: Float, num2: Float, num3: Float, num4: Float)
        Debug.TraceNotImplemented("Audio.UpdateCoralRiffVolume(Float, Float, Float, Float)")
    End Function

    Function UpdateShopkeeperVolume: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Audio.UpdateShopkeeperVolume(Int, Int)")
    End Function

    Function UpdateZone3Volume: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Audio.UpdateZone3Volume(Int, Int)")
    End Function

    Function _EditorFix: Void() End

End Class
