Class XMLNode

    Method AddChild: Object(name: Int, attributes: Int)
    End Method

    Method Export: Void(options: Int, buffer: Object, depth: Int)
    End Method

    Method ExportHack: Int(options: Int)
    End Method

    Method Free: Void()
    End Method

    Method GetAttribute: String(id: String)
    End Method

    Method GetAttribute: Bool(id: String, defaultValue: Bool)
    End Method

    Method GetAttribute: Int(id: String, defaultValue: Int)
    End Method

    Method GetAttribute: Float(id: String, defaultValue: Float)
    End Method

    Method GetAttribute: String(id: String, defaultValue: String)
    End Method

    Method GetChild: Object()
    End Method

    Method GetChild: Object(name: Int)
    End Method

    Method GetChild: Object(name: Int, attributes: Int)
    End Method

    Method GetChildAtPath: Object(path: Int)
    End Method

    Method GetChildAtPath: Object(path: Int, attributes: Int)
    End Method

    Method GetChildren: Object()
    End Method

    Method GetChildren: Object(name: Int)
    End Method

    Method GetChildren: Object(name: Int, attributes: Int)
    End Method

    Method GetChildrenWithAttributes: Object(attributes: Int)
    End Method

    Method GetXMLAttribute: Object(id: Int)
    End Method

    Method HasAttribute: Bool(id: Int)
    End Method

    Method RemoveAttribute: Void(id: Int)
    End Method

    Method RemoveChild: Void(child: Object)
    End Method

    Method SetAttribute: Void(id: Int)
    End Method

    Method SetAttribute: Void(id: Int, value: Bool)
    End Method

    Method SetAttribute: Void(id: Int, value: Int)
    End Method

    Method SetAttribute: Void(id: Int, value: Float)
    End Method

    Method SetAttribute: Void(id: Int, value: Int)
    End Method

    Method NoTrim()
        AddChild(0, 0)
        Export(0, Null, 0)
        ExportHack(0)
        Free()
        GetAttribute(0)
        GetAttribute(0, False)
        GetAttribute(0, 0)
        GetAttribute(0, 0)
        GetAttribute(0, 0)
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
        SetAttribute(0)
        SetAttribute(0, False)
        SetAttribute(0, 0)
        SetAttribute(0, 0)
        SetAttribute(0, 0)
    End Method

End Class
