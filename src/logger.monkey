Strict

Import brl.filestream
Import necrodancer

Global Debug: Logger = New Logger()

Class Logger

    Function _EditorFix: Void() End

    Method New()
        Self.fs = FileStream.Open("log.txt", "w")
        
        Self.WriteLine()
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
        If necrodancer.TRACE_NOT_IMPLEMENTED
            Self.WriteLine("[NI] " + name, LogLevel.Trace)
        End If
    End Method

    Method TraceEntered: Void(name: String)
        Self.WriteLine("Entered " + name, LogLevel.Trace)
    End Method

    ' Used for logging NecroDancer's existing log messages.
    Method Log: Void(str: String)
        Self.WriteLine(str, LogLevel.Debug)
    End Method

    Method Die: Void()
        Self.fs.Close()
    End Method

Private

    Field fs: FileStream

End Class

Class LogLevel

    Const Trace: Int = 0
    Const Debug: Int = 1

End Class
