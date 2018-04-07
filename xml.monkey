Strict

Class XMLNode

    Function _EditorFix: Void() End

    Method AddChild: Object(name: Int, attributes: Int)
        Throw New Throwable()
    End Method

    Method Export: Void(options: Int, buffer: Object, depth: Int)
        Throw New Throwable()
    End Method

    Method ExportHack: Int(options: Int)
        Throw New Throwable()
    End Method

    Method Free: Void()
        Throw New Throwable()
    End Method

    Method GetAttribute: String(id: String)
        Throw New Throwable()
    End Method

    Method GetAttribute: Bool(id: String, defaultValue: Bool)
        Throw New Throwable()
    End Method

    Method GetAttribute: Int(id: String, defaultValue: Int)
        Throw New Throwable()
    End Method

    Method GetAttribute: Float(id: String, defaultValue: Float)
        Throw New Throwable()
    End Method

    Method GetAttribute: String(id: String, defaultValue: String)
        Throw New Throwable()
    End Method

    Method GetChild: Object()
        Throw New Throwable()
    End Method

    Method GetChild: Object(name: Int)
        Throw New Throwable()
    End Method

    Method GetChild: Object(name: Int, attributes: Int)
        Throw New Throwable()
    End Method

    Method GetChildAtPath: Object(path: Int)
        Throw New Throwable()
    End Method

    Method GetChildAtPath: Object(path: Int, attributes: Int)
        Throw New Throwable()
    End Method

    Method GetChildren: Object()
        Throw New Throwable()
    End Method

    Method GetChildren: Object(name: Int)
        Throw New Throwable()
    End Method

    Method GetChildren: Object(name: Int, attributes: Int)
        Throw New Throwable()
    End Method

    Method GetChildrenWithAttributes: Object(attributes: Int)
        Throw New Throwable()
    End Method

    Method GetXMLAttribute: Object(id: Int)
        Throw New Throwable()
    End Method

    Method HasAttribute: Bool(id: Int)
        Throw New Throwable()
    End Method

    Method RemoveAttribute: Void(id: Int)
        Throw New Throwable()
    End Method

    Method RemoveChild: Void(child: Object)
        Throw New Throwable()
    End Method

    Method SetAttribute: Void(id: String)
        Throw New Throwable()
    End Method

    Method SetAttribute: Void(id: String, value: Bool)
        Throw New Throwable()
    End Method

    Method SetAttribute: Void(id: String, value: Int)
        Throw New Throwable()
    End Method

    Method SetAttribute: Void(id: String, value: Float)
        Throw New Throwable()
    End Method

    Method SetAttribute: Void(id: String, value: String)
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        AddChild(0, 0)
        Export(0, Null, 0)
        ExportHack(0)
        Free()
        GetAttribute("")
        GetAttribute("", False)
        GetAttribute("", 0)
        GetAttribute("", 0.0)
        GetAttribute("", "")
        GetChild()
        GetChild(0)
        GetChild(0, 0)
        GetChildAtPath(0)
        GetChildAtPath(0, 0)
        GetChildren()
        GetChildren(0)
        GetChildren(0, 0)
        GetChildrenWithAttributes(0)
        GetXMLAttribute(0)
        HasAttribute(0)
        RemoveAttribute(0)
        RemoveChild(Null)
        SetAttribute("")
        SetAttribute("", False)
        SetAttribute("", 0)
        SetAttribute("", 0.0)
        SetAttribute("", "")
    End Method

End Class
