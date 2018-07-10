'Strict

Import os
Import mojo.app
Import gui.controller_game
Import level
Import input2
Import logger
Import necrodancergame
Import player_class
Import steam
Import textlog
Import util
Import xml

Const NECRODANCER_XML_CHECKSUM: Int = 1495719624

Class GameData

    Const GAMEDATA_VERSION: String = String(2)

    Global activeMod: String
    Global cachedAudioLatency: Bool
    Global cachedAudioLatencyVal: Int
    Global cachedAutocalibration: Bool
    Global cachedAutocalibrationVal: Int
    Global cachedVideoLatency: Bool
    Global cachedVideoLatencyVal: Int
    Global gameDataLoaded: Bool
    Global lastDailyWithScore: Int = -1
    Global lastNumCoins: Int = -1
    Global lastNumDiamonds: Int = -1
    Global modGamedataChanges: Bool
    Global playerDataLoaded: Bool
    Global playerDataLoadPending: Bool
    Global replaySaveData: XMLDoc
    Global xmlSaveData: XMLDoc

    Function AddDiamondDealerItem: Void(itemName: String)
        Debug.TraceNotImplemented("GameData.AddDiamondDealerItem(String)")
    End Function

    Function AddPendingSpawnItem: Void(i: String)
        Local gameNode := GameData.xmlSaveData.GetChild("game")
        Local numPendingSpawnItems := GameData.GetNumPendingSpawnItems()

        gameNode.SetAttribute("pendingSpawnItemV2_" + numPendingSpawnItems, i)
        gameNode.SetAttribute("numPendingSpawnItemsV2", numPendingSpawnItems + 1)
    End Function

    Function CanDoDailyRun: Bool()
        Debug.TraceNotImplemented("GameData.CanDoDailyRun()")
    End Function

    Function EraseDiamondDealerItems: Void()
        Debug.TraceNotImplemented("GameData.EraseDiamondDealerItems()")
    End Function

    Function GetAlternateSkin: Int(charID: Int)
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("skinNum" + charID, 0)
    End Function

    Function GetAudioLatency: Int()
        If GameData.xmlSaveData = Null Or
           Level.isReplaying
            Return 0
        End If

        If Not GameData.cachedAudioLatency
            Local gameNode := GameData.xmlSaveData.GetChild("game")

            GameData.cachedAudioLatencyVal = gameNode.GetAttribute("audioLatency", 0)
            GameData.cachedAudioLatency = True
        End If

        Return GameData.cachedAudioLatencyVal
    End Function

    Function GetAutocalibration: Int()
        If GameData.xmlSaveData = Null Or
           Level.isReplaying
            Return 0
        End If

        If Not GameData.cachedAutocalibration
            Local gameNode := GameData.xmlSaveData.GetChild("game")

            GameData.cachedAutocalibrationVal = gameNode.GetAttribute("autocalibration", 0)
            GameData.cachedAutocalibration = True
        End If

        Return GameData.cachedAutocalibrationVal
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("daoustVocals", False)
    End Function

    Function GetDebugLogging: Bool()
        Debug.TraceNotImplemented("GameData.GetDebugLogging()")
    End Function

    Function GetDefaultCharacter: Int()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Local defaultCharacter := gameNode.GetAttribute("defaultCharacterV2", Character.Cadence)
        If defaultCharacter < 0 Or defaultCharacter >= Player.NumEnabledCharacters()
            defaultCharacter = Character.Cadence
        End If

        Return defaultCharacter
    End Function

    Function GetDefaultHUDKeys: Bool()
        Debug.TraceNotImplemented("GameData.GetDefaultHUDKeys()")
    End Function

    Function GetDefaultMod: String()
        Return GameData.xmlSaveData.GetChild("game").GetAttribute("defaultMod", "")
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("DLCPlayed", False)
    End Function

    Function GetDoubleSpeed: Bool(index: Int)
        Debug.TraceNotImplemented("GameData.GetDoubleSpeed(Int)")
    End Function

    Function GetEnableBossIntros: Bool()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("enableBossIntros", True)
    End Function

    Function GetEnableCutscenes: Bool()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("enableCutscenes", True)
    End Function

    Function GetEnableSubtitles: Bool()
        Debug.TraceNotImplemented("GameData.GetEnableSubtitles()")
    End Function

    Function GetFreshString: String()
        Return "<necrodancer><player v=~q" + GameData.GAMEDATA_VERSION + "~q></player><game></game><npc></npc></necrodancer>"
    End Function

    Function GetFullscreen: Bool()
        Return GameData.xmlSaveData.GetChild("game").GetAttribute("fullscreen", False)
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("keybinding" + player + "_" + index, InputValue.Default_)
    End Function

    Function GetLanguage: Int()
        Debug.TraceNotImplemented("GameData.GetLanguage()")
    End Function

    Function GetLatencyCalibrated: Bool()
        Debug.TraceNotImplemented("GameData.GetLatencyCalibrated()")
    End Function

    Function GetLobbyMove: Bool()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("lobbyMove", False)
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
        Local saveData: XMLDoc
        If Level.isReplaying And
           GameData.replaySaveData <> Null
            saveData = GameData.replaySaveData
        Else
            saveData = GameData.xmlSaveData
        End If

        Local npcNode := saveData.GetChild("npc")

        Return npcNode.GetAttribute(npcName, False)
    End Function

    Function GetNPCVisited: Bool(npcName: String)
        Debug.TraceNotImplemented("GameData.GetNPCVisited(String)")
    End Function

    Function GetNumPendingSpawnItems: Int()
        Local saveData: XMLDoc
        If Level.isReplaying And
           GameData.replaySaveData <> Null
            saveData = GameData.replaySaveData
        Else
            saveData = GameData.xmlSaveData
        End If

        Local gameNode := saveData.GetChild("game")

        Return gameNode.GetAttribute("numPendingSpawnItemsV2", 0)
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
        Local playerNode := GameData.xmlSaveData.GetChild("player")

        Return playerNode.GetAttribute("numDiamonds", 0)
    End Function

    Function GetPlayerHealthMax: Int()
        Local saveData: XMLDoc
        If Level.isReplaying And
           GameData.replaySaveData <> Null
            saveData = GameData.replaySaveData
        Else
            saveData = GameData.xmlSaveData
        End If

        Local playerNode := saveData.GetChild("player")

        Return playerNode.GetAttribute("maxHealth", 9)
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
        Return GameData.xmlSaveData.GetChild("game").GetAttribute("resolutionW", 0)
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
        Return GameData.xmlSaveData.GetChild("game").GetAttribute("shownNocturnaIntro", False)
    End Function

    Function GetShownSeizureWarning: Bool()
        Return GameData.xmlSaveData.GetChild("game").GetAttribute("shownSeizureWarning", False)
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("tutorialComplete", False)
    End Function

    Function GetUseChoral: Bool()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("useChoral", False)
    End Function

    Function GetVideoLatency: Int()
        Debug.TraceNotImplemented("GameData.GetVideoLatency()")
    End Function

    Function GetViewMultiplier: Int()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("viewMultiplier", 0)
    End Function

    Function GetVSync: Bool()
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("enableVsync", False)
    End Function

    Function GetZone1UnlockedCurrentCharacters: Bool()
        Debug.TraceNotImplemented("GameData.GetZone1UnlockedCurrentCharacters()")
    End Function

    Function GetZone2Unlocked: Bool(characterID: Int)
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Local attributeName := "Zone2Unlocked"
        If characterID <> Character.Cadence
            attributeName += characterID
        End If

        Return gameNode.GetAttribute(attributeName, False)
    End Function

    Function GetZone2UnlockedCurrentCharacters: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            Select player.characterID
                Case Character.Aria
                    If GameData.GetZone3Unlocked(Character.Aria)
                        Return True
                    End If
                Default
                    If GameData.GetZone2Unlocked(player.characterID)
                        Return True
                    End If
            End Select
        End For

        Return False
    End Function

    Function GetZone3Unlocked: Bool(characterID: Int)
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Local attributeName := "Zone3Unlocked"
        If characterID <> Character.Cadence
            attributeName += characterID
        End If

        Return gameNode.GetAttribute(attributeName, False)
    End Function

    Function GetZone3UnlockedCurrentCharacters: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            Select player.characterID
                Case Character.Aria
                    If GameData.GetZone2Unlocked(Character.Aria)
                        Return True
                    End If
                Default
                    If GameData.GetZone3Unlocked(player.characterID)
                        Return True
                    End If
            End Select
        End For

        Return False
    End Function

    Function GetZone4Unlocked: Bool(characterID: Int)
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Local attributeName := "Zone4Unlocked"
        If characterID <> Character.Cadence
            attributeName += characterID
        End If

        Return gameNode.GetAttribute(attributeName, False)
    End Function

    Function GetZone4UnlockedCurrentCharacters: Bool()
        For Local i := 0 Until controller_game.numPlayers
            Local player := controller_game.players[i]
            Select player.characterID
                Case Character.Aria
                    ' Do nothing
                Default
                    If GameData.GetZone3Unlocked(player.characterID)
                        Return True
                    End If
            End Select
        End For

        Return False
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")

        Return gameNode.GetAttribute("charUnlocked" + charNum, False)
    End Function

    Function LoadGameDataXML: Void(bypassChecksum: Bool)
        Local error := New XMLError()

        Local gameDataXMLPath := "necrodancer.xml"
        GameData.modGamedataChanges = False

        If GameData.activeMod <> ""
            If os.FileType(util.GetAppFolder() + GameData.activeMod + "/" + gameDataXMLPath) = os.FILETYPE_FILE
                gameDataXMLPath = util.GetAppFolder() + GameData.activeMod + "/" + gameDataXMLPath
                GameData.modGamedataChanges = True
            End If
        End If

        Local xmlStr := app.LoadString(gameDataXMLPath)

        If necrodancer.DEBUG_BUILD
            Local checksum := util.CalcChecksum(xmlStr)
            DebugLog("Checksum: " + checksum)
        Else
            If Not bypassChecksum And
               Not GameData.modGamedataChanges
                Local checksum := util.CalcChecksum(xmlStr)
                If checksum <> gamedata.NECRODANCER_XML_CHECKSUM
                    TextLog.ExitGame("NECRODANCER INIT XML CHECKSUM ERROR!")
                End If
            End If
        End If

        necrodancergame.xmlData = xml.ParseXML(xmlStr, error)
        If necrodancergame.xmlData = Null And
           error.error
            TextLog.ExitGame("NECRODANCER INIT XML PARSE ERROR: " + error)
        End If

        GameData.gameDataLoaded = True
    End Function

    Function LoadPlayerDataXML: Bool(forceCloud: Bool)
        Local xmlSaveDataFreshStr := GameData.GetFreshString()
        Local error := New XMLError()

        GameData.playerDataLoadPending = False

        Local playerID := steam.GetPlayerID()
        Local xmlSaveDataPath := "save_data" + playerID + ".xml"
        Local xmlSaveDataStr := app.LoadString(xmlSaveDataPath)
        If xmlSaveDataStr = ""
            xmlSaveDataStr = app.LoadString("save_data.xml")
        End If

        Local cloudTimestamp := steam.GetCloudSaveTimestamp()
        TextLog.Message("LoadPlayerDataXML(), cloudTimestamp=" + cloudTimestamp)

        Local loadedCloudSave: Bool

        If xmlSaveDataStr = ""
            If Not necrodancergame.DEBUG_DISABLE_CLOUD_SAVES And
               cloudTimestamp <> 0 And
               os.FileType("data/played.dat") <> os.FILETYPE_NONE
                xmlSaveDataStr = steam.LoadCloudSave()
                loadedCloudSave = True
            Else
                xmlSaveDataStr = xmlSaveDataFreshStr
            End If
        End If

        If forceCloud
            xmlSaveDataStr = steam.LoadCloudSave()
            loadedCloudSave = True
        End If

        GameData.xmlSaveData = xml.ParseXML(xmlSaveDataStr, error)

        If GameData.xmlSaveData = Null
            TextLog.Message("ERROR: Failed to load save data because of an XML parsing error")
            TextLog.Message(error)
            
            Local invalidSaveDataPath := "data/invalid_save_data.xml"
            TextLog.Message("Dumping the invalid save data to path :  " + invalidSaveDataPath)
            os.SaveString(xmlSaveDataStr, invalidSaveDataPath)

            TextLog.Message("Loading fresh save data instead")
            error = New XMLError()
            GameData.xmlSaveData = xml.ParseXML(xmlSaveDataFreshStr, error)
            Debug.Assert(GameData.xmlSaveData <> Null)
        End If

        If loadedCloudSave
            GameData.xmlSaveData.SetAttribute("cloudTimestamp", cloudTimestamp)
        End If

        If Not necrodancergame.DEBUG_DISABLE_CLOUD_SAVES And
           Not loadedCloudSave And
           cloudTimestamp <> 0
            Local localCloudTimestamp := GameData.xmlSaveData.GetAttribute("cloudTimestamp", 0)
            If localCloudTimestamp <> cloudTimestamp
                GameData.playerDataLoadPending = True
            End If
        End If

        Local playerNode := GameData.xmlSaveData.GetChild("player")
        Local dataVersion := playerNode.GetAttribute("v", String(0))
        TextLog.Message("DATA VERSION: " + dataVersion)

        If dataVersion <> GameData.GAMEDATA_VERSION
            Local oldXMLSaveDataPath := "data/save_data_OLD" + dataVersion + ".xml"
            Local oldXMLSaveDataStr := GameData.xmlSaveData.Export(xml.XML_STRIP_WHITESPACE)
            os.SaveString(oldXMLSaveDataStr, oldXMLSaveDataPath)

            error = New XMLError()
            GameData.xmlSaveData = xml.ParseXML(xmlSaveDataFreshStr, error)
        End If

        If GameData.xmlSaveData = Null
            If error.error
                TextLog.ExitGame("GAMEDATA XML PARSE ERROR: " + error)
            End If
        End If

        GameData.playerDataLoaded = True

        playerNode.RemoveAttribute("diamondDealerItems")
        playerNode.RemoveAttribute("diamondDealerSoldItem")
        playerNode.RemoveAttribute("diamondDealerSoldItem")
        playerNode.RemoveAttribute("diamondDealerSoldItem")

        Local gameNode := GameData.xmlSaveData.GetChild("game")
        gameNode.RemoveAttribute("numPendingSpawnItems")

        While gameNode.HasAttribute("pendingSpawnItem")
            gameNode.RemoveAttribute("pendingSpawnItem")
        End While

        If gameNode.HasAttribute("defaultCharacter")
            Local defaultCharacter := gameNode.GetAttribute("defaultCharacter", Character.Cadence)
            GameData.SetDefaultCharacter(defaultCharacter)

            gameNode.RemoveAttribute("defaultCharacter")
        End If

        Return GameData.playerDataLoadPending
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

    Function SetCharUnlocked: Void(charNum: Int, val: Bool = True)
        If Level.isReplaying
            Return
        End If

        Local gameNode := GameData.xmlSaveData.GetChild("game")
        gameNode.SetAttribute("charUnlocked" + charNum, val)
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
        Local gameNode := GameData.xmlSaveData.GetChild("game")
        gameNode.SetAttribute("DLCPlayed", "true")
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

    Function SetItemCleaned: Void(itemName: String, clean: Bool)
        If Level.isReplaying
            Return
        End If

        Local value := "false"
        If clean
            value = "true"
        End If

        Local playerNode := GameData.xmlSaveData.GetChild("player")
        playerNode.SetAttribute(itemName + "Cleaned", clean)
    End Function

    Function SetItemUnlocked: Void(itemName: String)
        If Level.isReplaying
            Return
        End If

        Local playerNode := GameData.xmlSaveData.GetChild("player")
        playerNode.SetAttribute(itemName + "Unlocked", "true")
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
        If val <> GameData.lastNumCoins
            GameData.lastNumCoins = val

            Local playerNode := GameData.xmlSaveData.GetChild("player")
            playerNode.SetAttribute("numCoins", val)
        End If
    End Function

    Function SetPlayerDiamonds: Void(val: Int)
        If val <> GameData.lastNumDiamonds
            GameData.lastNumDiamonds = val

            Local playerNode := GameData.xmlSaveData.GetChild("player")
            playerNode.SetAttribute("numDiamonds", val)
        End If
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
