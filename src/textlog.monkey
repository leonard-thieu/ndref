Strict

Import "native/textlog.cpp"
Import brl.filesystem
Import mojo.app
Import gui.controller_game
Import fmod
Import gamedata
Import logger
Import necrodancer
Import necrodancergame
Import steam
Import util

Global logTimestamp: String

Function ExitGameGlobal: Void(errorString: String, doExit: Bool)
    textlog.MessageGlobal(errorString, True)
    GameData.Save()
    Util.AddMetric("event", "necrodancerShutdown")

    If controller_game.totalPlaytimeMilliseconds < 15000
        Util.AddMetric("shutdownMessage", errorString, True, True)
    Else
        Util.AddMetric("shutdownMessage", errorString)

        Local playTimeInSeconds := controller_game.totalPlaytimeMilliseconds / 1000
        Util.AddMetric("playTimeInSeconds", String(playTimeInSeconds), True, True, True)
    End If

    fmod.EndFMOD()
    steam.SteamShutdown()

    If doExit
        Error(errorString)
    End If
End Function

Function ForceMessageGlobal: Void(str: String, flush: Bool)
    If textlog.logTimestamp = ""
        textlog.logTimestamp = textlog.GetTimeString(True)
    End If

    DebugLog(str)
    
    filesystem.CreateDir(GetAppFolder() + "logs")

    str += "~r"

    Local dateStr := textlog.GetDateString(False)
    Local filePath := GetAppFolder() + "logs/necrodancer_log_" + dateStr + "_" + textlog.logTimestamp + ".txt"

    AppendToLog(str, filePath, flush)
End Function

Function GetDateString: String(useNumericMonth: Bool)
    Local date := app.GetDate()

    Local year := date[0]
    Local month := date[1]
    Local day := date[2]

    Local yearStr := String(year)

    Local monthStr := String(month)
    If month < 10
        monthStr = "0" + monthStr
    End If

    Local dayStr := String(day)
    If day < 10
        dayStr = "0" + dayStr
    End If

    Local dateStr: String

    If useNumericMonth
        dateStr = yearStr + "_" + monthStr + "_" + dayStr
    Else
        monthStr = textlog.GetMonthString(month, False)

        dateStr = yearStr + "_" + monthStr + "_" + dayStr
    End If

    Return dateStr
End Function

Function GetMonthString: String(month: Int, addTags: Bool)
    Local monthStr: String

    If addTags
        Select month
            Case 0  monthStr = "|2009|JAN|"
            Case 1  monthStr = "|2010|FEB|"
            Case 2  monthStr = "|2011|MAR|"
            Case 3  monthStr = "|2012|APR|"
            Case 4  monthStr = "|2013|MAY|"
            Case 5  monthStr = "|2014|JUN|"
            Case 6  monthStr = "|2015|JUL|"
            Case 7  monthStr = "|2016|AUG|"
            Case 8  monthStr = "|2017|SEP|"
            Case 9  monthStr = "|2018|OCT|"
            Case 10 monthStr = "|2019|NOV|"
            Case 11 monthStr = "|2020|DEC|"
        End Select
    Else
        Select month
            Case 0  monthStr = "JAN"
            Case 1  monthStr = "FEB"
            Case 2  monthStr = "MAR"
            Case 3  monthStr = "APR"
            Case 4  monthStr = "MAY"
            Case 5  monthStr = "JUN"
            Case 6  monthStr = "JUL"
            Case 7  monthStr = "AUG"
            Case 8  monthStr = "SEP"
            Case 9  monthStr = "OCT"
            Case 10 monthStr = "NOV"
            Case 11 monthStr = "DEC"
        End Select
    End If

    Return monthStr
End Function

Function GetTimeString: String(nicerFormat: Bool)
    Local date := app.GetDate()

    Local hour := date[3]
    Local minute := date[4]
    Local second := date[5]

    Local hourStr := String(hour)
    If hour < 10
        hourStr = "0" + hourStr
    End If

    Local minuteStr := String(minute)
    If minute < 10
        minuteStr = "0" + minuteStr
    End If

    Local secondStr := String(second)
    If second < 10
        secondStr = "0" + secondStr
    End If

    Local timeStr: String
    
    If nicerFormat
        timeStr = hourStr + "h" + minuteStr + "m" + secondStr + "s"
    Else
        timeStr = hourStr + "_" + minuteStr + "_" + secondStr
    End If

    Return timeStr
End Function

Function MessageGlobal: Void(str: String, forceLog: Bool)
    If necrodancer.DEBUG_BUILD Or
       GameData.GetDebugLogging()
        Local flush: Bool
        If necrodancergame.DEBUG_LOG_OUTPUT Or
           forceLog Or
           GameData.GetDebugLogging()
            flush = True
        End If

        textlog.ForceMessageGlobal(str, flush)
    End If
End Function

Class TextLog

    Function ExitGame: Void(errorString: String)
        textlog.ExitGameGlobal(errorString, True)
    End Function

    Function ForceMessage: Void(str: String)
        textlog.ForceMessageGlobal(str, True)
    End Function

    Function Message: Void(str: String)
        textlog.MessageGlobal(str, False)
    End Function

    Function _EditorFix: Void() End

End Class

Extern

Function GetAppFolder: String()

Function AppendToLog: Void(line: String, path: String, flush: Bool)
