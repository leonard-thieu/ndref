Strict

Class GameData

    Global cachedAudioLatencyVal: Int
    Global cachedAutocalibrationVal: Int
    Global cachedVideoLatencyVal: Int
    Global gameDataLoaded: Bool
    Global lastDailyWithScore: Int
    Global lastNumCoins: Int
    Global lastNumDiamonds: Int
    Global modGamedataChanges: Bool
    Global playerDataLoaded: Bool
    Global replaySaveData: Object
    Global xmlSaveData: Object

    Function AddDiamondDealerItem: Void(itemName: Int)
        Throw New Throwable()
    End Function

    Function AddPendingSpawnItem: Void(i: Int)
        Throw New Throwable()
    End Function

    Function CanDoDailyRun: Bool()
        Throw New Throwable()
    End Function

    Function EraseDiamondDealerItems: Void()
        Throw New Throwable()
    End Function

    Function GetAlternateSkin: Int(charID: Int)
        Throw New Throwable()
    End Function

    Function GetAudioLatency: Int()
        Throw New Throwable()
    End Function

    Function GetAutocalibration: Int()
        Throw New Throwable()
    End Function

    Function GetBossTraining: Bool(bossName: Int)
        Throw New Throwable()
    End Function

    Function GetChangeLogShownForCurrentVersion: Bool()
        Throw New Throwable()
    End Function

    Function GetCustomMusic: Int(index: Int, num: Int, fromList: Bool)
        Throw New Throwable()
    End Function

    Function GetDaoustVocals: Bool()
        Throw New Throwable()
    End Function

    Function GetDebugLogging: Bool()
        Throw New Throwable()
    End Function

    Function GetDefaultCharacter: Int()
        Throw New Throwable()
    End Function

    Function GetDefaultHUDKeys: Bool()
        Throw New Throwable()
    End Function

    Function GetDefaultMod: Int()
        Throw New Throwable()
    End Function

    Function GetDiamondDealerItems: Int()
        Throw New Throwable()
    End Function

    Function GetDiamondDealerSoldItem: Int(num: Int)
        Throw New Throwable()
    End Function

    Function GetDiscoFloor: Bool()
        Throw New Throwable()
    End Function

    Function GetDLCPlayed: Bool()
        Throw New Throwable()
    End Function

    Function GetDoubleSpeed: Bool(index: Int)
        Throw New Throwable()
    End Function

    Function GetEnableBossIntros: Bool()
        Throw New Throwable()
    End Function

    Function GetEnableCutscenes: Bool()
        Throw New Throwable()
    End Function

    Function GetEnableSubtitles: Bool()
        Throw New Throwable()
    End Function

    Function GetFreshString: Int()
        Throw New Throwable()
    End Function

    Function GetFullscreen: Bool()
        Throw New Throwable()
    End Function

    Function GetHalfSpeed: Bool(index: Int)
        Throw New Throwable()
    End Function

    Function GetHardModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetHavePlayedHardcore: Bool()
        Throw New Throwable()
    End Function

    Function GetHUDBeatBars: Bool()
        Throw New Throwable()
    End Function

    Function GetHUDHeart: Bool()
        Throw New Throwable()
    End Function

    Function GetIgnoreMultipress: Bool()
        Throw New Throwable()
    End Function

    Function GetItemUnlocked: Bool(itemName: Int, includeClean: Bool)
        Throw New Throwable()
    End Function

    Function GetKeyBinding: Int(player: Int, index: Int)
        Throw New Throwable()
    End Function

    Function GetLanguage: Int()
        Throw New Throwable()
    End Function

    Function GetLatencyCalibrated: Bool()
        Throw New Throwable()
    End Function

    Function GetLobbyMove: Bool()
        Throw New Throwable()
    End Function

    Function GetMentorLevelClear: Bool(num: Int)
        Throw New Throwable()
    End Function

    Function GetMusicMode: Int()
        Throw New Throwable()
    End Function

    Function GetMusicPath: Int()
        Throw New Throwable()
    End Function

    Function GetMusicVolume: Float()
        Throw New Throwable()
    End Function

    Function GetMysteryModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetNoReturnModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetNPCUnlock: Bool(npcName: String)
        Throw New Throwable()
    End Function

    Function GetNPCVisited: Bool(npcName: String)
        Throw New Throwable()
    End Function

    Function GetNumPendingSpawnItems: Int()
        Throw New Throwable()
    End Function

    Function GetParticles: Bool()
        Throw New Throwable()
    End Function

    Function GetPauseOnMinimize: Bool()
        Throw New Throwable()
    End Function

    Function GetPendingSpawnItem: Int(num: Int)
        Throw New Throwable()
    End Function

    Function GetPhasingModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetPlayerDiamonds: Int()
        Throw New Throwable()
    End Function

    Function GetPlayerHealthMax: Int()
        Throw New Throwable()
    End Function

    Function GetPostDeathReplay: Bool()
        Throw New Throwable()
    End Function

    Function GetPrebossAudio: Bool()
        Throw New Throwable()
    End Function

    Function GetRandomizerModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetResolutionH: Int()
        Throw New Throwable()
    End Function

    Function GetResolutionW: Int()
        Throw New Throwable()
    End Function

    Function GetScreenShake: Bool()
        Throw New Throwable()
    End Function

    Function GetShowDiamondReminder: Bool()
        Throw New Throwable()
    End Function

    Function GetShowEnemyHearts: Bool()
        Throw New Throwable()
    End Function

    Function GetShowHints: Int()
        Throw New Throwable()
    End Function

    Function GetShowItemNames: Bool()
        Throw New Throwable()
    End Function

    Function GetShownNocturnaIntro: Bool()
        Throw New Throwable()
    End Function

    Function GetShownSeizureWarning: Bool()
        Throw New Throwable()
    End Function

    Function GetSoundtrackId: Int(i: Int)
        Throw New Throwable()
    End Function

    Function GetSoundtrackSuffix: Int(charID: Int)
        Throw New Throwable()
    End Function

    Function GetSoundVolume: Float()
        Throw New Throwable()
    End Function

    Function GetSpeedrunTimer: Bool()
        Throw New Throwable()
    End Function

    Function GetStoryModeComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetTutorialComplete: Bool()
        Throw New Throwable()
    End Function

    Function GetUseChoral: Bool()
        Throw New Throwable()
    End Function

    Function GetVideoLatency: Int()
        Throw New Throwable()
    End Function

    Function GetViewMultiplier: Int()
        Throw New Throwable()
    End Function

    Function GetVSync: Bool()
        Throw New Throwable()
    End Function

    Function GetZone1UnlockedCurrentCharacters: Bool()
        Throw New Throwable()
    End Function

    Function GetZone2Unlocked: Bool(characterID: Int)
        Throw New Throwable()
    End Function

    Function GetZone2UnlockedCurrentCharacters: Bool()
        Throw New Throwable()
    End Function

    Function GetZone3Unlocked: Bool(characterID: Int)
        Throw New Throwable()
    End Function

    Function GetZone3UnlockedCurrentCharacters: Bool()
        Throw New Throwable()
    End Function

    Function GetZone4Unlocked: Bool(characterID: Int)
        Throw New Throwable()
    End Function

    Function GetZone4UnlockedCurrentCharacters: Bool()
        Throw New Throwable()
    End Function

    Function GetZone5Visited: Bool()
        Throw New Throwable()
    End Function

    Function GetZoneHoardCollected: Bool(zone: Int)
        Throw New Throwable()
    End Function

    Function HasAskedLobbyMove: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtConductor: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtDeadRinger: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtFrankensteinway: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtLuteDragon: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtNecrodancer: Bool()
        Throw New Throwable()
    End Function

    Function HasFoughtNecrodancer2: Bool()
        Throw New Throwable()
    End Function

    Function HasItemBeenUsed: Bool(itemName: Int)
        Throw New Throwable()
    End Function

    Function HasKilledEnemy: Bool(enemyName: Int, type: Int)
        Throw New Throwable()
    End Function

    Function IsCharUnlocked: Bool(charNum: Int)
        Throw New Throwable()
    End Function

    Function LoadGameDataXML: Void(bypassChecksum: Bool)
        Throw New Throwable()
    End Function

    Function LoadPlayerDataXML: Bool(forceCloud: Bool)
        Throw New Throwable()
    End Function

    Function LoadReplayPlayerDataXML: Void(data: Int)
        Throw New Throwable()
    End Function

    Function LookupSoundtrackId: Int(name: Int)
        Throw New Throwable()
    End Function

    Function LookupSoundtrackName: Int(id: Int)
        Throw New Throwable()
    End Function

    Function RemovePendingSpawnItem: Void(item: Int)
        Throw New Throwable()
    End Function

    Function Save: Void()
        Throw New Throwable()
    End Function

    Function SetAlternateSkin: Void(charID: Int, skinNum: Int)
        Throw New Throwable()
    End Function

    Function SetAskedLobbyMove: Void(a: Bool)
        Throw New Throwable()
    End Function

    Function SetAutocalibration: Void(val: Int)
        Throw New Throwable()
    End Function

    Function SetBossTraining: Void(bossName: Int, val: Bool)
        Throw New Throwable()
    End Function

    Function SetChangeLogShownForCurrentVersion: Void()
        Throw New Throwable()
    End Function

    Function SetCharUnlocked: Void(charNum: Int, val: Bool)
        Throw New Throwable()
    End Function

    Function SetCustomMusic: Int(index: Int, filename: Int, addToPlaylist: Bool)
        Throw New Throwable()
    End Function

    Function SetDaoustVocals: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetDebugLogging: Void(m: Bool)
        Throw New Throwable()
    End Function

    Function SetDefaultCharacter: Void(c: Int)
        Throw New Throwable()
    End Function

    Function SetDefaultHUDKeys: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetDefaultMod: Void(m: Int)
        Throw New Throwable()
    End Function

    Function SetDiamondDealerSoldItem: Void(num: Int, itemName: Int)
        Throw New Throwable()
    End Function

    Function SetDiscoFloor: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetDLCPlayed: Void()
        Throw New Throwable()
    End Function

    Function SetDoubleSpeed: Void(index: Int, d: Bool)
        Throw New Throwable()
    End Function

    Function SetEnableBossIntros: Void(e: Bool)
        Throw New Throwable()
    End Function

    Function SetEnableCutscenes: Void(e: Bool)
        Throw New Throwable()
    End Function

    Function SetEnableSubtitles: Void(e: Bool)
        Throw New Throwable()
    End Function

    Function SetFoughtConductor: Void()
        Throw New Throwable()
    End Function

    Function SetFoughtDeadRinger: Void()
        Throw New Throwable()
    End Function

    Function SetFoughtFrankensteinway: Void()
        Throw New Throwable()
    End Function

    Function SetFoughtLuteDragon: Void()
        Throw New Throwable()
    End Function

    Function SetFoughtNecrodancer: Void()
        Throw New Throwable()
    End Function

    Function SetFoughtNecrodancer2: Void()
        Throw New Throwable()
    End Function

    Function SetFullscreen: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetHalfSpeed: Void(index: Int, d: Bool)
        Throw New Throwable()
    End Function

    Function SetHardModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetHavePlayedHardcore: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetHUDBeatBars: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetHUDHeart: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetIgnoreMultipress: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetItemCleaned: Void(itemName: Int, clean: Bool)
        Throw New Throwable()
    End Function

    Function SetItemUnlocked: Void(itemName: Int)
        Throw New Throwable()
    End Function

    Function SetItemUsed: Void(itemName: Int)
        Throw New Throwable()
    End Function

    Function SetKeyBinding: Void(player: Int, index: Int, key: Int)
        Throw New Throwable()
    End Function

    Function SetKilledEnemy: Void(enemyName: Int, type: Int, val: Bool)
        Throw New Throwable()
    End Function

    Function SetLanguage: Void(l: Int)
        Throw New Throwable()
    End Function

    Function SetLastDailyRunNum: Void(val: Int)
        Throw New Throwable()
    End Function

    Function SetLatencyValues: Void(audioLatency: Int, videoLatency: Int)
        Throw New Throwable()
    End Function

    Function SetLobbyMove: Void(m: Bool)
        Throw New Throwable()
    End Function

    Function SetMentorLevelClear: Void(num: Int)
        Throw New Throwable()
    End Function

    Function SetMusicMode: Void(m: Int)
        Throw New Throwable()
    End Function

    Function SetMusicPath: Void(path: Int)
        Throw New Throwable()
    End Function

    Function SetMusicVolume: Void(val: Float)
        Throw New Throwable()
    End Function

    Function SetMysteryModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetNoReturnModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetNPCUnlock: Void(npcName: Int, unlock: Bool)
        Throw New Throwable()
    End Function

    Function SetNPCVisited: Void(npcName: Int, visited: Bool)
        Throw New Throwable()
    End Function

    Function SetNumPendingSpawnItems: Void(num: Int)
        Throw New Throwable()
    End Function

    Function SetParticles: Void(p: Bool)
        Throw New Throwable()
    End Function

    Function SetPauseOnMinimize: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetPendingSpawnItem: Void(num: Int, i: Int)
        Throw New Throwable()
    End Function

    Function SetPhasingModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetPlayerCoins: Void(val: Int)
        Throw New Throwable()
    End Function

    Function SetPlayerDiamonds: Void(val: Int)
        Throw New Throwable()
    End Function

    Function SetPlayerHealthMax: Void(val: Int)
        Throw New Throwable()
    End Function

    Function SetPostDeathReplay: Void(p: Bool)
        Throw New Throwable()
    End Function

    Function SetPreBossAudio: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetRandomizerModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetResolution: Void(w: Int, h: Int)
        Throw New Throwable()
    End Function

    Function SetScreenShake: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetShowDiamondReminder: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetShowEnemyHearts: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetShowHints: Void(h: Int)
        Throw New Throwable()
    End Function

    Function SetShowItemNames: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetShownNocturnaIntro: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetShownSeizureWarning: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetSoundtrackId: Void(i: Int, id: Int)
        Throw New Throwable()
    End Function

    Function SetSoundVolume: Void(val: Float)
        Throw New Throwable()
    End Function

    Function SetSpeedrunTimer: Void(val: Bool)
        Throw New Throwable()
    End Function

    Function SetStoryModeComplete: Void()
        Throw New Throwable()
    End Function

    Function SetTutorialComplete: Void()
        Throw New Throwable()
    End Function

    Function SetUseChoral: Void(b: Bool)
        Throw New Throwable()
    End Function

    Function SetViewMultiplier: Void(mult: Int)
        Throw New Throwable()
    End Function

    Function SetVSync: Void(v: Bool)
        Throw New Throwable()
    End Function

    Function SetZone1UnlockedCurrentCharacters: Void()
        Throw New Throwable()
    End Function

    Function SetZone2Unlocked: Void(characterID: Int)
        Throw New Throwable()
    End Function

    Function SetZone2UnlockedCurrentCharacters: Void()
        Throw New Throwable()
    End Function

    Function SetZone3Unlocked: Void(characterID: Int)
        Throw New Throwable()
    End Function

    Function SetZone3UnlockedCurrentCharacters: Void()
        Throw New Throwable()
    End Function

    Function SetZone4UnlockedCurrentCharacters: Void()
        Throw New Throwable()
    End Function

    Function SetZone5Visited: Void()
        Throw New Throwable()
    End Function

    Function SetZoneHoardCollected: Void(zone: Int)
        Throw New Throwable()
    End Function

    Function SoundtrackNameAttr: Int(charID: Int)
        Throw New Throwable()
    End Function

    Function SoundtrackNumAttr: Int(charID: Int)
        Throw New Throwable()
    End Function

    Function WipeProgress: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Method NoTrim: Void()
        AddDiamondDealerItem(0)
        AddPendingSpawnItem(0)
        CanDoDailyRun()
        EraseDiamondDealerItems()
        GetAlternateSkin(0)
        GetAudioLatency()
        GetAutocalibration()
        GetBossTraining(0)
        GetChangeLogShownForCurrentVersion()
        GetCustomMusic(0, 0, False)
        GetDaoustVocals()
        GetDebugLogging()
        GetDefaultCharacter()
        GetDefaultHUDKeys()
        GetDefaultMod()
        GetDiamondDealerItems()
        GetDiamondDealerSoldItem(0)
        GetDiscoFloor()
        GetDLCPlayed()
        GetDoubleSpeed(0)
        GetEnableBossIntros()
        GetEnableCutscenes()
        GetEnableSubtitles()
        GetFreshString()
        GetFullscreen()
        GetHalfSpeed(0)
        GetHardModeComplete()
        GetHavePlayedHardcore()
        GetHUDBeatBars()
        GetHUDHeart()
        GetIgnoreMultipress()
        GetItemUnlocked(0, False)
        GetKeyBinding(0, 0)
        GetLanguage()
        GetLatencyCalibrated()
        GetLobbyMove()
        GetMentorLevelClear(0)
        GetMusicMode()
        GetMusicPath()
        GetMusicVolume()
        GetMysteryModeComplete()
        GetNoReturnModeComplete()
        GetNPCUnlock(0)
        GetNPCVisited(0)
        GetNumPendingSpawnItems()
        GetParticles()
        GetPauseOnMinimize()
        GetPendingSpawnItem(0)
        GetPhasingModeComplete()
        GetPlayerDiamonds()
        GetPlayerHealthMax()
        GetPostDeathReplay()
        GetPrebossAudio()
        GetRandomizerModeComplete()
        GetResolutionH()
        GetResolutionW()
        GetScreenShake()
        GetShowDiamondReminder()
        GetShowEnemyHearts()
        GetShowHints()
        GetShowItemNames()
        GetShownNocturnaIntro()
        GetShownSeizureWarning()
        GetSoundtrackId(0)
        GetSoundtrackSuffix(0)
        GetSoundVolume()
        GetSpeedrunTimer()
        GetStoryModeComplete()
        GetTutorialComplete()
        GetUseChoral()
        GetVideoLatency()
        GetViewMultiplier()
        GetVSync()
        GetZone1UnlockedCurrentCharacters()
        GetZone2Unlocked(0)
        GetZone2UnlockedCurrentCharacters()
        GetZone3Unlocked(0)
        GetZone3UnlockedCurrentCharacters()
        GetZone4Unlocked(0)
        GetZone4UnlockedCurrentCharacters()
        GetZone5Visited()
        GetZoneHoardCollected(0)
        HasAskedLobbyMove()
        HasFoughtConductor()
        HasFoughtDeadRinger()
        HasFoughtFrankensteinway()
        HasFoughtLuteDragon()
        HasFoughtNecrodancer()
        HasFoughtNecrodancer2()
        HasItemBeenUsed(0)
        HasKilledEnemy(0, 0)
        IsCharUnlocked(0)
        LoadGameDataXML(False)
        LoadPlayerDataXML(False)
        LoadReplayPlayerDataXML(0)
        LookupSoundtrackId(0)
        LookupSoundtrackName(0)
        RemovePendingSpawnItem(0)
        Save()
        SetAlternateSkin(0, 0)
        SetAskedLobbyMove(False)
        SetAutocalibration(0)
        SetBossTraining(0, False)
        SetChangeLogShownForCurrentVersion()
        SetCharUnlocked(0, False)
        SetCustomMusic(0, 0, False)
        SetDaoustVocals(False)
        SetDebugLogging(False)
        SetDefaultCharacter(0)
        SetDefaultHUDKeys(False)
        SetDefaultMod(0)
        SetDiamondDealerSoldItem(0, 0)
        SetDiscoFloor(False)
        SetDLCPlayed()
        SetDoubleSpeed(0, False)
        SetEnableBossIntros(False)
        SetEnableCutscenes(False)
        SetEnableSubtitles(False)
        SetFoughtConductor()
        SetFoughtDeadRinger()
        SetFoughtFrankensteinway()
        SetFoughtLuteDragon()
        SetFoughtNecrodancer()
        SetFoughtNecrodancer2()
        SetFullscreen(False)
        SetHalfSpeed(0, False)
        SetHardModeComplete()
        SetHavePlayedHardcore(False)
        SetHUDBeatBars(False)
        SetHUDHeart(False)
        SetIgnoreMultipress(False)
        SetItemCleaned(0, False)
        SetItemUnlocked(0)
        SetItemUsed(0)
        SetKeyBinding(0, 0, 0)
        SetKilledEnemy(0, 0, False)
        SetLanguage(0)
        SetLastDailyRunNum(0)
        SetLatencyValues(0, 0)
        SetLobbyMove(False)
        SetMentorLevelClear(0)
        SetMusicMode(0)
        SetMusicPath(0)
        SetMusicVolume(0)
        SetMysteryModeComplete()
        SetNoReturnModeComplete()
        SetNPCUnlock(0, False)
        SetNPCVisited(0, False)
        SetNumPendingSpawnItems(0)
        SetParticles(False)
        SetPauseOnMinimize(False)
        SetPendingSpawnItem(0, 0)
        SetPhasingModeComplete()
        SetPlayerCoins(0)
        SetPlayerDiamonds(0)
        SetPlayerHealthMax(0)
        SetPostDeathReplay(False)
        SetPreBossAudio(False)
        SetRandomizerModeComplete()
        SetResolution(0, 0)
        SetScreenShake(False)
        SetShowDiamondReminder(False)
        SetShowEnemyHearts(False)
        SetShowHints(0)
        SetShowItemNames(False)
        SetShownNocturnaIntro(False)
        SetShownSeizureWarning(False)
        SetSoundtrackId(0, 0)
        SetSoundVolume(0)
        SetSpeedrunTimer(False)
        SetStoryModeComplete()
        SetTutorialComplete()
        SetUseChoral(False)
        SetViewMultiplier(0)
        SetVSync(False)
        SetZone1UnlockedCurrentCharacters()
        SetZone2Unlocked(0)
        SetZone2UnlockedCurrentCharacters()
        SetZone3Unlocked(0)
        SetZone3UnlockedCurrentCharacters()
        SetZone4UnlockedCurrentCharacters()
        SetZone5Visited()
        SetZoneHoardCollected(0)
        SoundtrackNameAttr(0)
        SoundtrackNumAttr(0)
        WipeProgress()
    End Method

End Class
