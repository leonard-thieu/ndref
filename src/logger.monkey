Strict

Import brl.filestream
'Import mojo.app

Global Debug: Logger = New Logger()

Class Logger

    Function _EditorFix: Void() End

    Method New()
        Self.fs = FileStream.Open("log.txt", "a")
        
        Self.WriteLine()
        'Local timestamp := GetDate()
        'Local year := timestamp[0]
        'Local month := timestamp[1]
        'Local day := timestamp[2]
        'Local hour := timestamp[3]
        'Local minute := timestamp[4]
        'Local second := timestamp[5]
        'Local now := year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second
        'Self.WriteLine("** Logging started at " + now + " **", LogLevel.Trace)
    End Method

    Method Write: Void(value: String, level: Int)
        Self.fs.WriteString(value)
    End Method

    Method WriteLine: Void()
        Self.WriteLine("", LogLevel.Trace)
    End Method

    Method WriteLine: Void(value: String)
        Self.WriteLine(value, LogLevel.Trace)
    End Method

    Method WriteLine: Void(value: String, level: Int)
        Self.Write(value, level)
        Self.fs.WriteString("~r~n")
    End Method

    Method TraceNotImplemented: Void(name: String)
        Self.WriteLine("[NI] " + name, LogLevel.Trace)
    End Method

    Method Destroy: Void()
        Self.fs.Close()
    End Method

Private

    Field fs: FileStream

End Class

Class LogLevel

    Const Trace: Int = 0

End Class
