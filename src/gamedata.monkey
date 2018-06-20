'Strict

Import logger
Import necrodancergame
Import xml

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
    Global xmlSaveData: XMLDoc

    Function AddDiamondDealerItem: Void(itemName: Int)
        Debug.TraceNotImplemented("GameData.AddDiamondDealerItem(Int)")
    End Function

    Function AddPendingSpawnItem: Void(i: Int)
        Debug.TraceNotImplemented("GameData.AddPendingSpawnItem(Int)")
    End Function

    Function CanDoDailyRun: Bool()
        Debug.TraceNotImplemented("GameData.CanDoDailyRun()")
    End Function

    Function EraseDiamondDealerItems: Void()
        Debug.TraceNotImplemented("GameData.EraseDiamondDealerItems()")
    End Function

    Function GetAlternateSkin: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.GetAlternateSkin(Int)")
    End Function

    Function GetAudioLatency: Int()
        Debug.TraceNotImplemented("GameData.GetAudioLatency()")
    End Function

    Function GetAutocalibration: Int()
        Debug.TraceNotImplemented("GameData.GetAutocalibration()")
    End Function

    Function GetBossTraining: Bool(bossName: Int)
        Debug.TraceNotImplemented("GameData.GetBossTraining(Int)")
    End Function

    Function GetChangeLogShownForCurrentVersion: Bool()
        Debug.TraceNotImplemented("GameData.GetChangeLogShownForCurrentVersion()")
    End Function

    Function GetCustomMusic: Int(index: Int, num: Int, fromList: Bool)
        Debug.TraceNotImplemented("GameData.GetCustomMusic(Int, Int, Bool)")
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

    Function GetDiamondDealerItems: String()
        Debug.TraceNotImplemented("GameData.GetDiamondDealerItems()")
    End Function

    Function GetDiamondDealerSoldItem: Int(num: Int)
        Debug.TraceNotImplemented("GameData.GetDiamondDealerSoldItem(Int)")
    End Function

    Function GetDiscoFloor: Bool()
        Debug.TraceNotImplemented("GameData.GetDiscoFloor()")
    End Function

    Function GetDLCPlayed: Bool()
        Debug.TraceNotImplemented("GameData.GetDLCPlayed()")
    End Function

    Function GetDoubleSpeed: Bool(index: Int)
        Debug.TraceNotImplemented("GameData.GetDoubleSpeed(Int)")
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
        Debug.TraceNotImplemented("GameData.GetHalfSpeed(Int)")
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

    Function GetItemUnlocked: Bool(itemName: String, includeClean: Bool)
        Debug.TraceNotImplemented("GameData.GetItemUnlocked(String, Bool)")
    End Function

    Function GetKeyBinding: Int(player: Int, index: Int)
        Debug.TraceNotImplemented("GameData.GetKeyBinding(Int, Int)")
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
        Debug.TraceNotImplemented("GameData.GetMentorLevelClear(Int)")
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
        Debug.TraceNotImplemented("GameData.GetNPCUnlock(String)")
    End Function

    Function GetNPCVisited: Bool(npcName: String)
        Debug.TraceNotImplemented("GameData.GetNPCVisited(String)")
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
        Debug.TraceNotImplemented("GameData.GetPendingSpawnItem(Int)")
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
        Debug.TraceNotImplemented("GameData.GetSoundtrackId(Int)")
    End Function

    Function GetSoundtrackSuffix: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.GetSoundtrackSuffix(Int)")
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

        Return True
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
        Debug.TraceNotImplemented("GameData.GetZone2Unlocked(Int)")
    End Function

    Function GetZone2UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone2UnlockedCurrentCharacters()")
    End Function

    Function GetZone3Unlocked: Bool(characterID: Int)
        Debug.TraceNotImplemented("GameData.GetZone3Unlocked(Int)")
    End Function

    Function GetZone3UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone3UnlockedCurrentCharacters()")
    End Function

    Function GetZone4Unlocked: Bool(characterID: Int)
        Debug.TraceNotImplemented("GameData.GetZone4Unlocked(Int)")
    End Function

    Function GetZone4UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone4UnlockedCurrentCharacters()")
    End Function

    Function GetZone5Visited: Bool()
        Debug.TraceNotImplemented("GameData.GetZone5Visited()")
    End Function

    Function GetZoneHoardCollected: Bool(zone: Int)
        Debug.TraceNotImplemented("GameData.GetZoneHoardCollected(Int)")
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
        Debug.TraceNotImplemented("GameData.HasItemBeenUsed(Int)")
    End Function

    Function HasKilledEnemy: Bool(enemyName: Int, type: Int)
        Debug.TraceNotImplemented("GameData.HasKilledEnemy(Int, Int)")
    End Function

    Function IsCharUnlocked: Bool(charNum: Int)
        Debug.TraceNotImplemented("GameData.IsCharUnlocked(Int)")
    End Function

    Function LoadGameDataXML: Void(bypassChecksum: Bool)
        Local xmlStr := app.LoadString("monkey://data/necrodancer.xml")
        necrodancergame.xmlData = xml.ParseXML(xmlStr)

        Debug.TraceNotImplemented("GameData.LoadGameDataXML(Bool)")
    End Function

    Function LoadPlayerDataXML: Bool(forceCloud: Bool)
        Debug.TraceNotImplemented("GameData.LoadPlayerDataXML(Bool)")
    End Function

    Function LoadReplayPlayerDataXML: Void(data: Int)
        Debug.TraceNotImplemented("GameData.LoadReplayPlayerDataXML(Int)")
    End Function

    Function LookupSoundtrackId: Int(name: Int)
        Debug.TraceNotImplemented("GameData.LookupSoundtrackId(Int)")
    End Function

    Function LookupSoundtrackName: Int(id: Int)
        Debug.TraceNotImplemented("GameData.LookupSoundtrackName(Int)")
    End Function

    Function RemovePendingSpawnItem: Void(item: String)
        Debug.TraceNotImplemented("GameData.RemovePendingSpawnItem(String)")
    End Function

    Function Save: Void()
        Debug.TraceNotImplemented("GameData.Save()")
    End Function

    Function SetAlternateSkin: Void(charID: Int, skinNum: Int)
        Debug.TraceNotImplemented("GameData.SetAlternateSkin(Int, Int)")
    End Function

    Function SetAskedLobbyMove: Void(a: Bool)
        Debug.TraceNotImplemented("GameData.SetAskedLobbyMove(Bool)")
    End Function

    Function SetAutocalibration: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetAutocalibration(Int)")
    End Function

    Function SetBossTraining: Void(bossName: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetBossTraining(Int, Bool)")
    End Function

    Function SetChangeLogShownForCurrentVersion: Void()
        Debug.TraceNotImplemented("GameData.SetChangeLogShownForCurrentVersion()")
    End Function

    Function SetCharUnlocked: Void(charNum: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetCharUnlocked(Int, Bool)")
    End Function

    Function SetCustomMusic: Int(index: Int, filename: Int, addToPlaylist: Bool)
        Debug.TraceNotImplemented("GameData.SetCustomMusic(Int, Int, Bool)")
    End Function

    Function SetDaoustVocals: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetDaoustVocals(Bool)")
    End Function

    Function SetDebugLogging: Void(m: Bool)
        Debug.TraceNotImplemented("GameData.SetDebugLogging(Bool)")
    End Function

    Function SetDefaultCharacter: Void(c: Int)
        Debug.TraceNotImplemented("GameData.SetDefaultCharacter(Int)")
    End Function

    Function SetDefaultHUDKeys: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetDefaultHUDKeys(Bool)")
    End Function

    Function SetDefaultMod: Void(m: Int)
        Debug.TraceNotImplemented("GameData.SetDefaultMod(Int)")
    End Function

    Function SetDiamondDealerSoldItem: Void(num: Int, itemName: Int)
        Debug.TraceNotImplemented("GameData.SetDiamondDealerSoldItem(Int, Int)")
    End Function

    Function SetDiscoFloor: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetDiscoFloor(Bool)")
    End Function

    Function SetDLCPlayed: Void()
        Debug.TraceNotImplemented("GameData.SetDLCPlayed()")
    End Function

    Function SetDoubleSpeed: Void(index: Int, d: Bool)
        Debug.TraceNotImplemented("GameData.SetDoubleSpeed(Int, Bool)")
    End Function

    Function SetEnableBossIntros: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableBossIntros(Bool)")
    End Function

    Function SetEnableCutscenes: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableCutscenes(Bool)")
    End Function

    Function SetEnableSubtitles: Void(e: Bool)
        Debug.TraceNotImplemented("GameData.SetEnableSubtitles(Bool)")
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
        Debug.TraceNotImplemented("GameData.SetFullscreen(Bool)")
    End Function

    Function SetHalfSpeed: Void(index: Int, d: Bool)
        Debug.TraceNotImplemented("GameData.SetHalfSpeed(Int, Bool)")
    End Function

    Function SetHardModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetHardModeComplete()")
    End Function

    Function SetHavePlayedHardcore: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHavePlayedHardcore(Bool)")
    End Function

    Function SetHUDBeatBars: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHUDBeatBars(Bool)")
    End Function

    Function SetHUDHeart: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetHUDHeart(Bool)")
    End Function

    Function SetIgnoreMultipress: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetIgnoreMultipress(Bool)")
    End Function

    Function SetItemCleaned: Void(itemName: Int, clean: Bool)
        Debug.TraceNotImplemented("GameData.SetItemCleaned(Int, Bool)")
    End Function

    Function SetItemUnlocked: Void(itemName: Int)
        Debug.TraceNotImplemented("GameData.SetItemUnlocked(Int)")
    End Function

    Function SetItemUsed: Void(itemName: Int)
        Debug.TraceNotImplemented("GameData.SetItemUsed(Int)")
    End Function

    Function SetKeyBinding: Void(player: Int, index: Int, key: Int)
        Debug.TraceNotImplemented("GameData.SetKeyBinding(Int, Int, Int)")
    End Function

    Function SetKilledEnemy: Void(enemyName: String, type: Int, val: Bool)
        Debug.TraceNotImplemented("GameData.SetKilledEnemy(String, Int, Bool)")
    End Function

    Function SetLanguage: Void(l: Int)
        Debug.TraceNotImplemented("GameData.SetLanguage(Int)")
    End Function

    Function SetLastDailyRunNum: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetLastDailyRunNum(Int)")
    End Function

    Function SetLatencyValues: Void(audioLatency: Int, videoLatency: Int)
        Debug.TraceNotImplemented("GameData.SetLatencyValues(Int, Int)")
    End Function

    Function SetLobbyMove: Void(m: Bool)
        Debug.TraceNotImplemented("GameData.SetLobbyMove(Bool)")
    End Function

    Function SetMentorLevelClear: Void(num: Int)
        Debug.TraceNotImplemented("GameData.SetMentorLevelClear(Int)")
    End Function

    Function SetMusicMode: Void(m: Int)
        Debug.TraceNotImplemented("GameData.SetMusicMode(Int)")
    End Function

    Function SetMusicPath: Void(path: Int)
        Debug.TraceNotImplemented("GameData.SetMusicPath(Int)")
    End Function

    Function SetMusicVolume: Void(val: Float)
        Debug.TraceNotImplemented("GameData.SetMusicVolume(Float)")
    End Function

    Function SetMysteryModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetMysteryModeComplete()")
    End Function

    Function SetNoReturnModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetNoReturnModeComplete()")
    End Function

    Function SetNPCUnlock: Void(npcName: Int, unlock: Bool)
        Debug.TraceNotImplemented("GameData.SetNPCUnlock(Int, Bool)")
    End Function

    Function SetNPCVisited: Void(npcName: Int, visited: Bool)
        Debug.TraceNotImplemented("GameData.SetNPCVisited(Int, Bool)")
    End Function

    Function SetNumPendingSpawnItems: Void(num: Int)
        Debug.TraceNotImplemented("GameData.SetNumPendingSpawnItems(Int)")
    End Function

    Function SetParticles: Void(p: Bool)
        Debug.TraceNotImplemented("GameData.SetParticles(Bool)")
    End Function

    Function SetPauseOnMinimize: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetPauseOnMinimize(Bool)")
    End Function

    Function SetPendingSpawnItem: Void(num: Int, i: Int)
        Debug.TraceNotImplemented("GameData.SetPendingSpawnItem(Int, Int)")
    End Function

    Function SetPhasingModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetPhasingModeComplete()")
    End Function

    Function SetPlayerCoins: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerCoins(Int)")
    End Function

    Function SetPlayerDiamonds: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerDiamonds(Int)")
    End Function

    Function SetPlayerHealthMax: Void(val: Int)
        Debug.TraceNotImplemented("GameData.SetPlayerHealthMax(Int)")
    End Function

    Function SetPostDeathReplay: Void(p: Bool)
        Debug.TraceNotImplemented("GameData.SetPostDeathReplay(Bool)")
    End Function

    Function SetPreBossAudio: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetPreBossAudio(Bool)")
    End Function

    Function SetRandomizerModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetRandomizerModeComplete()")
    End Function

    Function SetResolution: Void(w: Int, h: Int)
        Debug.TraceNotImplemented("GameData.SetResolution(Int, Int)")
    End Function

    Function SetScreenShake: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetScreenShake(Bool)")
    End Function

    Function SetShowDiamondReminder: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowDiamondReminder(Bool)")
    End Function

    Function SetShowEnemyHearts: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowEnemyHearts(Bool)")
    End Function

    Function SetShowHints: Void(h: Int)
        Debug.TraceNotImplemented("GameData.SetShowHints(Int)")
    End Function

    Function SetShowItemNames: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShowItemNames(Bool)")
    End Function

    Function SetShownNocturnaIntro: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShownNocturnaIntro(Bool)")
    End Function

    Function SetShownSeizureWarning: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetShownSeizureWarning(Bool)")
    End Function

    Function SetSoundtrackId: Void(i: Int, id: Int)
        Debug.TraceNotImplemented("GameData.SetSoundtrackId(Int, Int)")
    End Function

    Function SetSoundVolume: Void(val: Float)
        Debug.TraceNotImplemented("GameData.SetSoundVolume(Float)")
    End Function

    Function SetSpeedrunTimer: Void(val: Bool)
        Debug.TraceNotImplemented("GameData.SetSpeedrunTimer(Bool)")
    End Function

    Function SetStoryModeComplete: Void()
        Debug.TraceNotImplemented("GameData.SetStoryModeComplete()")
    End Function

    Function SetTutorialComplete: Void()
        Debug.TraceNotImplemented("GameData.SetTutorialComplete()")
    End Function

    Function SetUseChoral: Void(b: Bool)
        Debug.TraceNotImplemented("GameData.SetUseChoral(Bool)")
    End Function

    Function SetViewMultiplier: Void(mult: Int)
        Debug.TraceNotImplemented("GameData.SetViewMultiplier(Int)")
    End Function

    Function SetVSync: Void(v: Bool)
        Debug.TraceNotImplemented("GameData.SetVSync(Bool)")
    End Function

    Function SetZone1UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone1UnlockedCurrentCharacters()")
    End Function

    Function SetZone2Unlocked: Void(characterID: Int)
        Debug.TraceNotImplemented("GameData.SetZone2Unlocked(Int)")
    End Function

    Function SetZone2UnlockedCurrentCharacters: Void()
        Debug.TraceNotImplemented("GameData.SetZone2UnlockedCurrentCharacters()")
    End Function

    Function SetZone3Unlocked: Void(characterID: Int)
        Debug.TraceNotImplemented("GameData.SetZone3Unlocked(Int)")
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
        Debug.TraceNotImplemented("GameData.SetZoneHoardCollected(Int)")
    End Function

    Function SoundtrackNameAttr: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.SoundtrackNameAttr(Int)")
    End Function

    Function SoundtrackNumAttr: Int(charID: Int)
        Debug.TraceNotImplemented("GameData.SoundtrackNumAttr(Int)")
    End Function

    Function WipeProgress: Void()
        Debug.TraceNotImplemented("GameData.WipeProgress()")
    End Function

    Function _EditorFix: Void() End

End Class
