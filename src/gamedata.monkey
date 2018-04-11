'Strict

Import logger

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
        Debug.TraceNotImplemented("GameData.AddDiamondDealerItem()")
    End Function

    Function AddPendingSpawnItem: Void(i: Int)
        Debug.TraceNotImplemented("GameData.AddPendingSpawnItem()")
    End Function

    Function CanDoDailyRun: Bool()
        Debug.TraceNotImplemented("GameData.CanDoDailyRun()")
    End Function

    Function EraseDiamondDealerItems: Void()
        Debug.TraceNotImplemented("GameData.EraseDiamondDealerItems()")
    End Function

    Function GetAlternateSkin: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.GetAlternateSkin()")
    End Function

    Function GetAudioLatency: Int()
        Debug.TraceNotImplemented("GameData.GetAudioLatency()")
    End Function

    Function GetAutocalibration: Int()
        Debug.TraceNotImplemented("GameData.GetAutocalibration()")
    End Function

    Function GetBossTraining: Bool(bossName: Int)
        Debug.TraceNotImplemented("GameData.GetBossTraining()")
    End Function

    Function GetChangeLogShownForCurrentVersion: Bool()
        Debug.TraceNotImplemented("GameData.GetChangeLogShownForCurrentVersion()")
    End Function

    Function GetCustomMusic: Int(index: Int, num: Int, fromList: Bool)
        Debug.TraceNotImplemented("GameData.GetCustomMusic()")
    End Function

    Function GetDaoustVocals: Bool()
        Debug.TraceNotImplemented("GameData.GetDaoustVocals()")
    End Function

    Function GetDebugLogging: Bool()
        Debug.TraceNotImplemented("GameData.GetDebugLogging()")
    End Function

    Function GetDefaultCharacter: Int()
        Debug.TraceNotImplemented("GameData.GetDefaultCharacter()")
    End Function

    Function GetDefaultHUDKeys: Bool()
        Debug.TraceNotImplemented("GameData.GetDefaultHUDKeys()")
    End Function

    Function GetDefaultMod: Int()
        Debug.TraceNotImplemented("GameData.GetDefaultMod()")
    End Function

    Function GetDiamondDealerItems: Int()
        Debug.TraceNotImplemented("GameData.GetDiamondDealerItems()")
    End Function

    Function GetDiamondDealerSoldItem: Int(num: Int)
        Debug.TraceNotImplemented("GameData.GetDiamondDealerSoldItem()")
    End Function

    Function GetDiscoFloor: Bool()
        Debug.TraceNotImplemented("GameData.GetDiscoFloor()")
    End Function

    Function GetDLCPlayed: Bool()
        Debug.TraceNotImplemented("GameData.GetDLCPlayed()")
    End Function

    Function GetDoubleSpeed: Bool(index: Int)
        Debug.TraceNotImplemented("GameData.GetDoubleSpeed()")
    End Function

    Function GetEnableBossIntros: Bool()
        Debug.TraceNotImplemented("GameData.GetEnableBossIntros()")
    End Function

    Function GetEnableCutscenes: Bool()
        Debug.TraceNotImplemented("GameData.GetEnableCutscenes()")
    End Function

    Function GetEnableSubtitles: Bool()
        Debug.TraceNotImplemented("GameData.GetEnableSubtitles()")
    End Function

    Function GetFreshString: Int()
        Debug.TraceNotImplemented("GameData.GetFreshString()")
    End Function

    Function GetFullscreen: Bool()
        Debug.TraceNotImplemented("GameData.GetFullscreen()")
    End Function

    Function GetHalfSpeed: Bool(index: Int)
        Debug.TraceNotImplemented("GameData.GetHalfSpeed()")
    End Function

    Function GetHardModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetHardModeComplete()")
    End Function

    Function GetHavePlayedHardcore: Bool()
        Debug.TraceNotImplemented("GameData.GetHavePlayedHardcore()")
    End Function

    Function GetHUDBeatBars: Bool()
        Debug.TraceNotImplemented("GameData.GetHUDBeatBars()")
    End Function

    Function GetHUDHeart: Bool()
        Debug.TraceNotImplemented("GameData.GetHUDHeart()")
    End Function

    Function GetIgnoreMultipress: Bool()
        Debug.TraceNotImplemented("GameData.GetIgnoreMultipress()")
    End Function

    Function GetItemUnlocked: Bool(itemName: Int, includeClean: Bool)
        Debug.TraceNotImplemented("GameData.GetItemUnlocked()")
    End Function

    Function GetKeyBinding: Int(player: Int, index: Int)
        Debug.TraceNotImplemented("GameData.GetKeyBinding()")
    End Function

    Function GetLanguage: Int()
        Debug.TraceNotImplemented("GameData.GetLanguage()")
    End Function

    Function GetLatencyCalibrated: Bool()
        Debug.TraceNotImplemented("GameData.GetLatencyCalibrated()")
    End Function

    Function GetLobbyMove: Bool()
        Debug.TraceNotImplemented("GameData.GetLobbyMove()")
    End Function

    Function GetMentorLevelClear: Bool(num: Int)
        Debug.TraceNotImplemented("GameData.GetMentorLevelClear()")
    End Function

    Function GetMusicMode: Int()
        Debug.TraceNotImplemented("GameData.GetMusicMode()")
    End Function

    Function GetMusicPath: Int()
        Debug.TraceNotImplemented("GameData.GetMusicPath()")
    End Function

    Function GetMusicVolume: Float()
        Debug.TraceNotImplemented("GameData.GetMusicVolume()")
    End Function

    Function GetMysteryModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetMysteryModeComplete()")
    End Function

    Function GetNoReturnModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetNoReturnModeComplete()")
    End Function

    Function GetNPCUnlock: Bool(npcName: String)
        Debug.TraceNotImplemented("GameData.GetNPCUnlock()")
    End Function

    Function GetNPCVisited: Bool(npcName: String)
        Debug.TraceNotImplemented("GameData.GetNPCVisited()")
    End Function

    Function GetNumPendingSpawnItems: Int()
        Debug.TraceNotImplemented("GameData.GetNumPendingSpawnItems()")
    End Function

    Function GetParticles: Bool()
        Debug.TraceNotImplemented("GameData.GetParticles()")
    End Function

    Function GetPauseOnMinimize: Bool()
        Debug.TraceNotImplemented("GameData.GetPauseOnMinimize()")
    End Function

    Function GetPendingSpawnItem: Int(num: Int)
        Debug.TraceNotImplemented("GameData.GetPendingSpawnItem()")
    End Function

    Function GetPhasingModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetPhasingModeComplete()")
    End Function

    Function GetPlayerDiamonds: Int()
        Debug.TraceNotImplemented("GameData.GetPlayerDiamonds()")
    End Function

    Function GetPlayerHealthMax: Int()
        Debug.TraceNotImplemented("GameData.GetPlayerHealthMax()")
    End Function

    Function GetPostDeathReplay: Bool()
        Debug.TraceNotImplemented("GameData.GetPostDeathReplay()")
    End Function

    Function GetPrebossAudio: Bool()
        Debug.TraceNotImplemented("GameData.GetPrebossAudio()")
    End Function

    Function GetRandomizerModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetRandomizerModeComplete()")
    End Function

    Function GetResolutionH: Int()
        Debug.TraceNotImplemented("GameData.GetResolutionH()")
    End Function

    Function GetResolutionW: Int()
        Debug.TraceNotImplemented("GameData.GetResolutionW()")
    End Function

    Function GetScreenShake: Bool()
        Debug.TraceNotImplemented("GameData.GetScreenShake()")
    End Function

    Function GetShowDiamondReminder: Bool()
        Debug.TraceNotImplemented("GameData.GetShowDiamondReminder()")
    End Function

    Function GetShowEnemyHearts: Bool()
        Debug.TraceNotImplemented("GameData.GetShowEnemyHearts()")
    End Function

    Function GetShowHints: Int()
        Debug.TraceNotImplemented("GameData.GetShowHints()")
    End Function

    Function GetShowItemNames: Bool()
        Debug.TraceNotImplemented("GameData.GetShowItemNames()")
    End Function

    Function GetShownNocturnaIntro: Bool()
        Debug.TraceNotImplemented("GameData.GetShownNocturnaIntro()")
    End Function

    Function GetShownSeizureWarning: Bool()
        Debug.TraceNotImplemented("GameData.GetShownSeizureWarning()")
    End Function

    Function GetSoundtrackId: Int(i: Int)
        Debug.TraceNotImplemented("GameData.GetSoundtrackId()")
    End Function

    Function GetSoundtrackSuffix: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.GetSoundtrackSuffix()")
    End Function

    Function GetSoundVolume: Float()
        Debug.TraceNotImplemented("GameData.GetSoundVolume()")
    End Function

    Function GetSpeedrunTimer: Bool()
        Debug.TraceNotImplemented("GameData.GetSpeedrunTimer()")
    End Function

    Function GetStoryModeComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetStoryModeComplete()")
    End Function

    Function GetTutorialComplete: Bool()
        Debug.TraceNotImplemented("GameData.GetTutorialComplete()")
    End Function

    Function GetUseChoral: Bool()
        Debug.TraceNotImplemented("GameData.GetUseChoral()")
    End Function

    Function GetVideoLatency: Int()
        Debug.TraceNotImplemented("GameData.GetVideoLatency()")
    End Function

    Function GetViewMultiplier: Int()
        Debug.TraceNotImplemented("GameData.GetViewMultiplier()")
    End Function

    Function GetVSync: Bool()
        Debug.TraceNotImplemented("GameData.GetVSync()")
    End Function

    Function GetZone1UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone1UnlockedCurrentCharacters()")
    End Function

    Function GetZone2Unlocked: Bool(characterID: Int)
        Debug.TraceNotImplemented("GameData.GetZone2Unlocked()")
    End Function

    Function GetZone2UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone2UnlockedCurrentCharacters()")
    End Function

    Function GetZone3Unlocked: Bool(characterID: Int)
        Debug.TraceNotImplemented("GameData.GetZone3Unlocked()")
    End Function

    Function GetZone3UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone3UnlockedCurrentCharacters()")
    End Function

    Function GetZone4Unlocked: Bool(characterID: Int)
        Debug.TraceNotImplemented("GameData.GetZone4Unlocked()")
    End Function

    Function GetZone4UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone4UnlockedCurrentCharacters()")
    End Function

    Function GetZone5Visited: Bool()
        Debug.TraceNotImplemented("GameData.GetZone5Visited()")
    End Function

    Function GetZoneHoardCollected: Bool(zone: Int)
        Debug.TraceNotImplemented("GameData.GetZoneHoardCollected()")
    End Function

    Function HasAskedLobbyMove: Bool()
        Debug.TraceNotImplemented("GameData.HasAskedLobbyMove()")
    End Function

    Function HasFoughtConductor: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtConductor()")
    End Function

    Function HasFoughtDeadRinger: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtDeadRinger()")
    End Function

    Function HasFoughtFrankensteinway: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtFrankensteinway()")
    End Function

    Function HasFoughtLuteDragon: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtLuteDragon()")
    End Function

    Function HasFoughtNecrodancer: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtNecrodancer()")
    End Function

    Function HasFoughtNecrodancer2: Bool()
        Debug.TraceNotImplemented("GameData.HasFoughtNecrodancer2()")
    End Function

    Function HasItemBeenUsed: Bool(itemName: Int)
        Debug.TraceNotImplemented("GameData.HasItemBeenUsed()")
    End Function

    Function HasKilledEnemy: Bool(enemyName: Int, type: Int)
        Debug.TraceNotImplemented("GameData.HasKilledEnemy()")
    End Function

    Function IsCharUnlocked: Bool(charNum: Int)
        Debug.TraceNotImplemented("GameData.IsCharUnlocked()")
    End Function

    Function LoadGameDataXML: Void(bypassChecksum: Bool)
        Debug.TraceNotImplemented("GameData.LoadGameDataXML()")
    End Function

    Function LoadPlayerDataXML: Bool(forceCloud: Bool)
        Debug.TraceNotImplemented("GameData.LoadPlayerDataXML()")
    End Function

    Function LoadReplayPlayerDataXML: Void(data: Int)
        Debug.TraceNotImplemented("GameData.LoadReplayPlayerDataXML()")
    End Function

    Function LookupSoundtrackId: Int(name: Int)
        Debug.TraceNotImplemented("GameData.LookupSoundtrackId()")
    End Function

    Function LookupSoundtrackName: Int(id: Int)
        Debug.TraceNotImplemented("GameData.LookupSoundtrackName()")
    End Function

    Function RemovePendingSpawnItem: Void(item: Int)
        Debug.TraceNotImplemented("GameData.RemovePendingSpawnItem()")
    End Function

    Function Save: Void()
        Debug.TraceNotImplemented("GameData.Save()")
    End Function

    Function SetAlternateSkin: Void(charID: Int, skinNum: Int)
        Debug.TraceNotImplemented("GameData.SetAlternateSkin()")
    End Function

    Function SetAskedLobbyMove: Void(a: Bool)
        Debug.TraceNotImplemented("GameData.SetAskedLobbyMove()")
    End Function

    Function SetAutocalibration: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetAutocalibration()")
    End Function

    Function SetBossTraining: Void(bossName: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetBossTraining()")
    End Function

    Function SetChangeLogShownForCurrentVersion: Void()
        Debug.TraceNotImplemented("GameData.SetChangeLogShownForCurrentVersion()")
    End Function

    Function SetCharUnlocked: Void(charNum: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetCharUnlocked()")
    End Function

    Function SetCustomMusic: Int(index: Int, filename: Int, addToPlaylist: Bool)
        Debug.TraceNotImplemented("GameData.SetCustomMusic()")
    End Function

    Function SetDaoustVocals: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetDaoustVocals()")
    End Function

    Function SetDebugLogging: Void(m: Bool)
        Debug.TraceNotImplemented("GameData.SetDebugLogging()")
    End Function

    Function SetDefaultCharacter: Void(c: Int)
        Debug.TraceNotImplemented("GameData.SetDefaultCharacter()")
    End Function

    Function SetDefaultHUDKeys: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetDefaultHUDKeys()")
    End Function

    Function SetDefaultMod: Void(m: Int)
        Debug.TraceNotImplemented("GameData.SetDefaultMod()")
    End Function

    Function SetDiamondDealerSoldItem: Void(num: Int, itemName: Int)
        Debug.TraceNotImplemented("GameData.SetDiamondDealerSoldItem()")
    End Function

    Function SetDiscoFloor: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetDiscoFloor()")
    End Function

    Function SetDLCPlayed: Void()
        Debug.TraceNotImplemented("GameData.SetDLCPlayed()")
    End Function

    Function SetDoubleSpeed: Void(index: Int, d: Bool)
        Debug.TraceNotImplemented("GameData.SetDoubleSpeed()")
    End Function

    Function SetEnableBossIntros: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableBossIntros()")
    End Function

    Function SetEnableCutscenes: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableCutscenes()")
    End Function

    Function SetEnableSubtitles: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableSubtitles()")
    End Function

    Function SetFoughtConductor: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtConductor()")
    End Function

    Function SetFoughtDeadRinger: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtDeadRinger()")
    End Function

    Function SetFoughtFrankensteinway: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtFrankensteinway()")
    End Function

    Function SetFoughtLuteDragon: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtLuteDragon()")
    End Function

    Function SetFoughtNecrodancer: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtNecrodancer()")
    End Function

    Function SetFoughtNecrodancer2: Void()
        Debug.TraceNotImplemented("GameData.SetFoughtNecrodancer2()")
    End Function

    Function SetFullscreen: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetFullscreen()")
    End Function

    Function SetHalfSpeed: Void(index: Int, d: Bool)
        Debug.TraceNotImplemented("GameData.SetHalfSpeed()")
    End Function

    Function SetHardModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetHardModeComplete()")
    End Function

    Function SetHavePlayedHardcore: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHavePlayedHardcore()")
    End Function

    Function SetHUDBeatBars: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHUDBeatBars()")
    End Function

    Function SetHUDHeart: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHUDHeart()")
    End Function

    Function SetIgnoreMultipress: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetIgnoreMultipress()")
    End Function

    Function SetItemCleaned: Void(itemName: Int, clean: Bool)
        Debug.TraceNotImplemented("GameData.SetItemCleaned()")
    End Function

    Function SetItemUnlocked: Void(itemName: Int)
        Debug.TraceNotImplemented("GameData.SetItemUnlocked()")
    End Function

    Function SetItemUsed: Void(itemName: Int)
        Debug.TraceNotImplemented("GameData.SetItemUsed()")
    End Function

    Function SetKeyBinding: Void(player: Int, index: Int, key: Int)
        Debug.TraceNotImplemented("GameData.SetKeyBinding()")
    End Function

    Function SetKilledEnemy: Void(enemyName: Int, type: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetKilledEnemy()")
    End Function

    Function SetLanguage: Void(l: Int)
        Debug.TraceNotImplemented("GameData.SetLanguage()")
    End Function

    Function SetLastDailyRunNum: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetLastDailyRunNum()")
    End Function

    Function SetLatencyValues: Void(audioLatency: Int, videoLatency: Int)
        Debug.TraceNotImplemented("GameData.SetLatencyValues()")
    End Function

    Function SetLobbyMove: Void(m: Bool)
        Debug.TraceNotImplemented("GameData.SetLobbyMove()")
    End Function

    Function SetMentorLevelClear: Void(num: Int)
        Debug.TraceNotImplemented("GameData.SetMentorLevelClear()")
    End Function

    Function SetMusicMode: Void(m: Int)
        Debug.TraceNotImplemented("GameData.SetMusicMode()")
    End Function

    Function SetMusicPath: Void(path: Int)
        Debug.TraceNotImplemented("GameData.SetMusicPath()")
    End Function

    Function SetMusicVolume: Void(val: Float)
        Debug.TraceNotImplemented("GameData.SetMusicVolume()")
    End Function

    Function SetMysteryModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetMysteryModeComplete()")
    End Function

    Function SetNoReturnModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetNoReturnModeComplete()")
    End Function

    Function SetNPCUnlock: Void(npcName: Int, unlock: Bool)
        Debug.TraceNotImplemented("GameData.SetNPCUnlock()")
    End Function

    Function SetNPCVisited: Void(npcName: Int, visited: Bool)
        Debug.TraceNotImplemented("GameData.SetNPCVisited()")
    End Function

    Function SetNumPendingSpawnItems: Void(num: Int)
        Debug.TraceNotImplemented("GameData.SetNumPendingSpawnItems()")
    End Function

    Function SetParticles: Void(p: Bool)
        Debug.TraceNotImplemented("GameData.SetParticles()")
    End Function

    Function SetPauseOnMinimize: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetPauseOnMinimize()")
    End Function

    Function SetPendingSpawnItem: Void(num: Int, i: Int)
        Debug.TraceNotImplemented("GameData.SetPendingSpawnItem()")
    End Function

    Function SetPhasingModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetPhasingModeComplete()")
    End Function

    Function SetPlayerCoins: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerCoins()")
    End Function

    Function SetPlayerDiamonds: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerDiamonds()")
    End Function

    Function SetPlayerHealthMax: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerHealthMax()")
    End Function

    Function SetPostDeathReplay: Void(p: Bool)
        Debug.TraceNotImplemented("GameData.SetPostDeathReplay()")
    End Function

    Function SetPreBossAudio: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetPreBossAudio()")
    End Function

    Function SetRandomizerModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetRandomizerModeComplete()")
    End Function

    Function SetResolution: Void(w: Int, h: Int)
        Debug.TraceNotImplemented("GameData.SetResolution()")
    End Function

    Function SetScreenShake: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetScreenShake()")
    End Function

    Function SetShowDiamondReminder: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowDiamondReminder()")
    End Function

    Function SetShowEnemyHearts: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowEnemyHearts()")
    End Function

    Function SetShowHints: Void(h: Int)
        Debug.TraceNotImplemented("GameData.SetShowHints()")
    End Function

    Function SetShowItemNames: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowItemNames()")
    End Function

    Function SetShownNocturnaIntro: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShownNocturnaIntro()")
    End Function

    Function SetShownSeizureWarning: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShownSeizureWarning()")
    End Function

    Function SetSoundtrackId: Void(i: Int, id: Int)
        Debug.TraceNotImplemented("GameData.SetSoundtrackId()")
    End Function

    Function SetSoundVolume: Void(val: Float)
        Debug.TraceNotImplemented("GameData.SetSoundVolume()")
    End Function

    Function SetSpeedrunTimer: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetSpeedrunTimer()")
    End Function

    Function SetStoryModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetStoryModeComplete()")
    End Function

    Function SetTutorialComplete: Void()
        Debug.TraceNotImplemented("GameData.SetTutorialComplete()")
    End Function

    Function SetUseChoral: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetUseChoral()")
    End Function

    Function SetViewMultiplier: Void(mult: Int)
        Debug.TraceNotImplemented("GameData.SetViewMultiplier()")
    End Function

    Function SetVSync: Void(v: Bool)
        Debug.TraceNotImplemented("GameData.SetVSync()")
    End Function

    Function SetZone1UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone1UnlockedCurrentCharacters()")
    End Function

    Function SetZone2Unlocked: Void(characterID: Int)
        Debug.TraceNotImplemented("GameData.SetZone2Unlocked()")
    End Function

    Function SetZone2UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone2UnlockedCurrentCharacters()")
    End Function

    Function SetZone3Unlocked: Void(characterID: Int)
        Debug.TraceNotImplemented("GameData.SetZone3Unlocked()")
    End Function

    Function SetZone3UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone3UnlockedCurrentCharacters()")
    End Function

    Function SetZone4UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone4UnlockedCurrentCharacters()")
    End Function

    Function SetZone5Visited: Void()
        Debug.TraceNotImplemented("GameData.SetZone5Visited()")
    End Function

    Function SetZoneHoardCollected: Void(zone: Int)
        Debug.TraceNotImplemented("GameData.SetZoneHoardCollected()")
    End Function

    Function SoundtrackNameAttr: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.SoundtrackNameAttr()")
    End Function

    Function SoundtrackNumAttr: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.SoundtrackNumAttr()")
    End Function

    Function WipeProgress: Void()
        Debug.TraceNotImplemented("GameData.WipeProgress()")
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
