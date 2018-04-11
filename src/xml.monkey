'Strict

Import logger

Class XMLDoc Extends XMLNode

    Function _EditorFix: Void() End

End Class

Class XMLNode

    Function _EditorFix: Void() End

    Method AddChild: Object(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.AddChild()")
    End Method

    Method Export: Void(options: Int, buffer: Object, depth: Int)
        Debug.TraceNotImplemented("XMLNode.Export()")
    End Method

    Method ExportHack: Int(options: Int)
        Debug.TraceNotImplemented("XMLNode.ExportHack()")
    End Method

    Method Free: Void()
        Debug.TraceNotImplemented("XMLNode.Free()")
    End Method

    Method GetAttribute: String(id: String)
        Debug.TraceNotImplemented("XMLNode.GetAttribute()")
    End Method

    Method GetAttribute: Bool(id: String, defaultValue: Bool)
        Debug.TraceNotImplemented("XMLNode.GetAttribute()")
    End Method

    Method GetAttribute: Int(id: String, defaultValue: Int)
        Debug.TraceNotImplemented("XMLNode.GetAttribute()")
    End Method

    Method GetAttribute: Float(id: String, defaultValue: Float)
        Debug.TraceNotImplemented("XMLNode.GetAttribute()")
    End Method

    Method GetAttribute: String(id: String, defaultValue: String)
        Debug.TraceNotImplemented("XMLNode.GetAttribute()")
    End Method

    Method GetChild: Object()
        Debug.TraceNotImplemented("XMLNode.GetChild()")
    End Method

    Method GetChild: Object(name: String)
        Debug.TraceNotImplemented("XMLNode.GetChild()")
    End Method

    Method GetChild: Object(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChild()")
    End Method

    Method GetChildAtPath: XMLNode(path: String)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath()")
    End Method

    Method GetChildAtPath: XMLNode(path: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath()")
    End Method

    Method GetChildren: Object()
        Debug.TraceNotImplemented("XMLNode.GetChildren()")
    End Method

    Method GetChildren: Object(name: String)
        Debug.TraceNotImplemented("XMLNode.GetChildren()")
    End Method

    Method GetChildren: Object(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildren()")
    End Method

    Method GetChildrenWithAttributes: Object(attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildrenWithAttributes()")
    End Method

    Method GetXMLAttribute: Object(id: Int)
        Debug.TraceNotImplemented("XMLNode.GetXMLAttribute()")
    End Method

    Method HasAttribute: Bool(id: Int)
        Debug.TraceNotImplemented("XMLNode.HasAttribute()")
    End Method

    Method RemoveAttribute: Void(id: Int)
        Debug.TraceNotImplemented("XMLNode.RemoveAttribute()")
    End Method

    Method RemoveChild: Void(child: Object)
        Debug.TraceNotImplemented("XMLNode.RemoveChild()")
    End Method

    Method SetAttribute: Void(id: String)
        Debug.TraceNotImplemented("XMLNode.SetAttribute()")
    End Method

    Method SetAttribute: Void(id: String, value: Bool)
        Debug.TraceNotImplemented("XMLNode.SetAttribute()")
    End Method

    Method SetAttribute: Void(id: String, value: Int)
        Debug.TraceNotImplemented("XMLNode.SetAttribute()")
    End Method

    Method SetAttribute: Void(id: String, value: Float)
        Debug.TraceNotImplemented("XMLNode.SetAttribute()")
    End Method

    Method SetAttribute: Void(id: String, value: String)
        Debug.TraceNotImplemented("XMLNode.SetAttribute()")
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
