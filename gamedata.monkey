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
    End Function

    Function AddPendingSpawnItem: Void(i: Int)
    End Function

    Function CanDoDailyRun: Bool()
    End Function

    Function EraseDiamondDealerItems: Void()
    End Function

    Function GetAlternateSkin: Int(charID: Int)
    End Function

    Function GetAudioLatency: Int()
    End Function

    Function GetAutocalibration: Int()
    End Function

    Function GetBossTraining: Bool(bossName: Int)
    End Function

    Function GetChangeLogShownForCurrentVersion: Bool()
    End Function

    Function GetCustomMusic: Int(index: Int, num: Int, fromList: Bool)
    End Function

    Function GetDaoustVocals: Bool()
    End Function

    Function GetDebugLogging: Bool()
    End Function

    Function GetDefaultCharacter: Int()
    End Function

    Function GetDefaultHUDKeys: Bool()
    End Function

    Function GetDefaultMod: Int()
    End Function

    Function GetDiamondDealerItems: Int()
    End Function

    Function GetDiamondDealerSoldItem: Int(num: Int)
    End Function

    Function GetDiscoFloor: Bool()
    End Function

    Function GetDLCPlayed: Bool()
    End Function

    Function GetDoubleSpeed: Bool(index: Int)
    End Function

    Function GetEnableBossIntros: Bool()
    End Function

    Function GetEnableCutscenes: Bool()
    End Function

    Function GetEnableSubtitles: Bool()
    End Function

    Function GetFreshString: Int()
    End Function

    Function GetFullscreen: Bool()
    End Function

    Function GetHalfSpeed: Bool(index: Int)
    End Function

    Function GetHardModeComplete: Bool()
    End Function

    Function GetHavePlayedHardcore: Bool()
    End Function

    Function GetHUDBeatBars: Bool()
    End Function

    Function GetHUDHeart: Bool()
    End Function

    Function GetIgnoreMultipress: Bool()
    End Function

    Function GetItemUnlocked: Bool(itemName: Int, includeClean: Bool)
    End Function

    Function GetKeyBinding: Int(player: Int, index: Int)
    End Function

    Function GetLanguage: Int()
    End Function

    Function GetLatencyCalibrated: Bool()
    End Function

    Function GetLobbyMove: Bool()
    End Function

    Function GetMentorLevelClear: Bool(num: Int)
    End Function

    Function GetMusicMode: Int()
    End Function

    Function GetMusicPath: Int()
    End Function

    Function GetMusicVolume: Float()
    End Function

    Function GetMysteryModeComplete: Bool()
    End Function

    Function GetNoReturnModeComplete: Bool()
    End Function

    Function GetNPCUnlock: Bool(npcName: String)
    End Function

    Function GetNPCVisited: Bool(npcName: String)
    End Function

    Function GetNumPendingSpawnItems: Int()
    End Function

    Function GetParticles: Bool()
    End Function

    Function GetPauseOnMinimize: Bool()
    End Function

    Function GetPendingSpawnItem: Int(num: Int)
    End Function

    Function GetPhasingModeComplete: Bool()
    End Function

    Function GetPlayerDiamonds: Int()
    End Function

    Function GetPlayerHealthMax: Int()
    End Function

    Function GetPostDeathReplay: Bool()
    End Function

    Function GetPrebossAudio: Bool()
    End Function

    Function GetRandomizerModeComplete: Bool()
    End Function

    Function GetResolutionH: Int()
    End Function

    Function GetResolutionW: Int()
    End Function

    Function GetScreenShake: Bool()
    End Function

    Function GetShowDiamondReminder: Bool()
    End Function

    Function GetShowEnemyHearts: Bool()
    End Function

    Function GetShowHints: Int()
    End Function

    Function GetShowItemNames: Bool()
    End Function

    Function GetShownNocturnaIntro: Bool()
    End Function

    Function GetShownSeizureWarning: Bool()
    End Function

    Function GetSoundtrackId: Int(i: Int)
    End Function

    Function GetSoundtrackSuffix: Int(charID: Int)
    End Function

    Function GetSoundVolume: Float()
    End Function

    Function GetSpeedrunTimer: Bool()
    End Function

    Function GetStoryModeComplete: Bool()
    End Function

    Function GetTutorialComplete: Bool()
    End Function

    Function GetUseChoral: Bool()
    End Function

    Function GetVideoLatency: Int()
    End Function

    Function GetViewMultiplier: Int()
    End Function

    Function GetVSync: Bool()
    End Function

    Function GetZone1UnlockedCurrentCharacters: Bool()
    End Function

    Function GetZone2Unlocked: Bool(characterID: Int)
    End Function

    Function GetZone2UnlockedCurrentCharacters: Bool()
    End Function

    Function GetZone3Unlocked: Bool(characterID: Int)
    End Function

    Function GetZone3UnlockedCurrentCharacters: Bool()
    End Function

    Function GetZone4Unlocked: Bool(characterID: Int)
    End Function

    Function GetZone4UnlockedCurrentCharacters: Bool()
    End Function

    Function GetZone5Visited: Bool()
    End Function

    Function GetZoneHoardCollected: Bool(zone: Int)
    End Function

    Function HasAskedLobbyMove: Bool()
    End Function

    Function HasFoughtConductor: Bool()
    End Function

    Function HasFoughtDeadRinger: Bool()
    End Function

    Function HasFoughtFrankensteinway: Bool()
    End Function

    Function HasFoughtLuteDragon: Bool()
    End Function

    Function HasFoughtNecrodancer: Bool()
    End Function

    Function HasFoughtNecrodancer2: Bool()
    End Function

    Function HasItemBeenUsed: Bool(itemName: Int)
    End Function

    Function HasKilledEnemy: Bool(enemyName: Int, type: Int)
    End Function

    Function IsCharUnlocked: Bool(charNum: Int)
    End Function

    Function LoadGameDataXML: Void(bypassChecksum: Bool)
    End Function

    Function LoadPlayerDataXML: Bool(forceCloud: Bool)
    End Function

    Function LoadReplayPlayerDataXML: Void(data: Int)
    End Function

    Function LookupSoundtrackId: Int(name: Int)
    End Function

    Function LookupSoundtrackName: Int(id: Int)
    End Function

    Function RemovePendingSpawnItem: Void(item: Int)
    End Function

    Function Save: Void()
    End Function

    Function SetAlternateSkin: Void(charID: Int, skinNum: Int)
    End Function

    Function SetAskedLobbyMove: Void(a: Bool)
    End Function

    Function SetAutocalibration: Void(val: Int)
    End Function

    Function SetBossTraining: Void(bossName: Int, val: Bool)
    End Function

    Function SetChangeLogShownForCurrentVersion: Void()
    End Function

    Function SetCharUnlocked: Void(charNum: Int, val: Bool)
    End Function

    Function SetCustomMusic: Int(index: Int, filename: Int, addToPlaylist: Bool)
    End Function

    Function SetDaoustVocals: Void(b: Bool)
    End Function

    Function SetDebugLogging: Void(m: Bool)
    End Function

    Function SetDefaultCharacter: Void(c: Int)
    End Function

    Function SetDefaultHUDKeys: Void(b: Bool)
    End Function

    Function SetDefaultMod: Void(m: Int)
    End Function

    Function SetDiamondDealerSoldItem: Void(num: Int, itemName: Int)
    End Function

    Function SetDiscoFloor: Void(val: Bool)
    End Function

    Function SetDLCPlayed: Void()
    End Function

    Function SetDoubleSpeed: Void(index: Int, d: Bool)
    End Function

    Function SetEnableBossIntros: Void(e: Bool)
    End Function

    Function SetEnableCutscenes: Void(e: Bool)
    End Function

    Function SetEnableSubtitles: Void(e: Bool)
    End Function

    Function SetFoughtConductor: Void()
    End Function

    Function SetFoughtDeadRinger: Void()
    End Function

    Function SetFoughtFrankensteinway: Void()
    End Function

    Function SetFoughtLuteDragon: Void()
    End Function

    Function SetFoughtNecrodancer: Void()
    End Function

    Function SetFoughtNecrodancer2: Void()
    End Function

    Function SetFullscreen: Void(val: Bool)
    End Function

    Function SetHalfSpeed: Void(index: Int, d: Bool)
    End Function

    Function SetHardModeComplete: Void()
    End Function

    Function SetHavePlayedHardcore: Void(val: Bool)
    End Function

    Function SetHUDBeatBars: Void(val: Bool)
    End Function

    Function SetHUDHeart: Void(val: Bool)
    End Function

    Function SetIgnoreMultipress: Void(b: Bool)
    End Function

    Function SetItemCleaned: Void(itemName: Int, clean: Bool)
    End Function

    Function SetItemUnlocked: Void(itemName: Int)
    End Function

    Function SetItemUsed: Void(itemName: Int)
    End Function

    Function SetKeyBinding: Void(player: Int, index: Int, key: Int)
    End Function

    Function SetKilledEnemy: Void(enemyName: Int, type: Int, val: Bool)
    End Function

    Function SetLanguage: Void(l: Int)
    End Function

    Function SetLastDailyRunNum: Void(val: Int)
    End Function

    Function SetLatencyValues: Void(audioLatency: Int, videoLatency: Int)
    End Function

    Function SetLobbyMove: Void(m: Bool)
    End Function

    Function SetMentorLevelClear: Void(num: Int)
    End Function

    Function SetMusicMode: Void(m: Int)
    End Function

    Function SetMusicPath: Void(path: Int)
    End Function

    Function SetMusicVolume: Void(val: Float)
    End Function

    Function SetMysteryModeComplete: Void()
    End Function

    Function SetNoReturnModeComplete: Void()
    End Function

    Function SetNPCUnlock: Void(npcName: Int, unlock: Bool)
    End Function

    Function SetNPCVisited: Void(npcName: Int, visited: Bool)
    End Function

    Function SetNumPendingSpawnItems: Void(num: Int)
    End Function

    Function SetParticles: Void(p: Bool)
    End Function

    Function SetPauseOnMinimize: Void(b: Bool)
    End Function

    Function SetPendingSpawnItem: Void(num: Int, i: Int)
    End Function

    Function SetPhasingModeComplete: Void()
    End Function

    Function SetPlayerCoins: Void(val: Int)
    End Function

    Function SetPlayerDiamonds: Void(val: Int)
    End Function

    Function SetPlayerHealthMax: Void(val: Int)
    End Function

    Function SetPostDeathReplay: Void(p: Bool)
    End Function

    Function SetPreBossAudio: Void(b: Bool)
    End Function

    Function SetRandomizerModeComplete: Void()
    End Function

    Function SetResolution: Void(w: Int, h: Int)
    End Function

    Function SetScreenShake: Void(val: Bool)
    End Function

    Function SetShowDiamondReminder: Void(b: Bool)
    End Function

    Function SetShowEnemyHearts: Void(b: Bool)
    End Function

    Function SetShowHints: Void(h: Int)
    End Function

    Function SetShowItemNames: Void(b: Bool)
    End Function

    Function SetShownNocturnaIntro: Void(b: Bool)
    End Function

    Function SetShownSeizureWarning: Void(b: Bool)
    End Function

    Function SetSoundtrackId: Void(i: Int, id: Int)
    End Function

    Function SetSoundVolume: Void(val: Float)
    End Function

    Function SetSpeedrunTimer: Void(val: Bool)
    End Function

    Function SetStoryModeComplete: Void()
    End Function

    Function SetTutorialComplete: Void()
    End Function

    Function SetUseChoral: Void(b: Bool)
    End Function

    Function SetViewMultiplier: Void(mult: Int)
    End Function

    Function SetVSync: Void(v: Bool)
    End Function

    Function SetZone1UnlockedCurrentCharacters: Void()
    End Function

    Function SetZone2Unlocked: Void(characterID: Int)
    End Function

    Function SetZone2UnlockedCurrentCharacters: Void()
    End Function

    Function SetZone3Unlocked: Void(characterID: Int)
    End Function

    Function SetZone3UnlockedCurrentCharacters: Void()
    End Function

    Function SetZone4UnlockedCurrentCharacters: Void()
    End Function

    Function SetZone5Visited: Void()
    End Function

    Function SetZoneHoardCollected: Void(zone: Int)
    End Function

    Function SoundtrackNameAttr: Int(charID: Int)
    End Function

    Function SoundtrackNumAttr: Int(charID: Int)
    End Function

    Function WipeProgress: Void()
    End Function

    Function _EditorFix() End

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
