'Strict

Import monkey.list
Import monkey.map
Import logger

Function ParseXML: XMLDoc(raw: String, error: XMLError = Null)
    Debug.TraceNotImplemented("ParseXML(String, XMLError)")
End Function

Class XMLNode

    Function _EditorFix: Void() End

    Method New(name: String, valid: Bool)
        Debug.TraceNotImplemented("XMLNode.New(String, Bool)")
    End Method

    Field firstChild: XMLNode
    Field doc: XMLDoc
    Field name: String
    Field nextSibling: XMLNode
    Field attributes: StringMap
    Field value: String
    Field children: List<XMLNode>
    Field valid: Bool
    Field path: String
    Field pathList: List<XMLNode>
    Field parent: XMLNode
    Field line: Int
    Field column: Int
    Field offset: Int
    Field lastChild: XMLNode
    Field previousSibling: XMLNode

    Method AddChild: XMLNode(name: String, attributes: String = "")
        Debug.TraceNotImplemented("XMLNode.AddChild(String, String)")
    End Method

    Method Clone: XMLDoc(options: Int)
        Debug.TraceNotImplemented("XMLNode.Clone(Int)")
    End Method

    Method Export: String(options: Int)
        Debug.TraceNotImplemented("XMLNode.Export(Int)")
    End Method

    Method Export: Void(options: Int, buffer: XMLStringBuffer, depth: Int)
        Debug.TraceNotImplemented("XMLNode.Export(Int, XMLStringBuffer, Int)")
    End Method

    Method ExportHack: String(options: Int)
        Debug.TraceNotImplemented("XMLNode.ExportHack(Int)")
    End Method

    Method Free: Void()
        Debug.TraceNotImplemented("XMLNode.Free()")
    End Method

    Method GetAttribute: String(id: String)
        Debug.TraceNotImplemented("XMLNode.GetAttribute(String)")
    End Method

    Method GetAttribute: Bool(id: String, defaultValue: Bool)
        Debug.TraceNotImplemented("XMLNode.GetAttribute(String, Bool)")
    End Method

    Method GetAttribute: Int(id: String, defaultValue: Int)
        Debug.TraceNotImplemented("XMLNode.GetAttribute(String, Int)")
    End Method

    Method GetAttribute: Float(id: String, defaultValue: Float)
        Debug.TraceNotImplemented("XMLNode.GetAttribute(String, Float)")
    End Method

    Method GetAttribute: String(id: String, defaultValue: String)
        Debug.TraceNotImplemented("XMLNode.GetAttribute(String, String)")
    End Method

    Method GetChild: XMLNode()
        Debug.TraceNotImplemented("XMLNode.GetChild()")
    End Method

    Method GetChild: XMLNode(name: String)
        Debug.TraceNotImplemented("XMLNode.GetChild(String)")
    End Method

    Method GetChild: XMLNode(name: String, attributes: String)
        Debug.TraceNotImplemented("XMLNode.GetChild(String, String)")
    End Method

    Method GetChildAtPath: XMLNode(path: String)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath(String)")
    End Method

    Method GetChildAtPath: XMLNode(path: String, attributes: String)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath(String, String)")
    End Method

    Method GetChildren: List<XMLNode>()
        Debug.TraceNotImplemented("XMLNode.GetChildren()")
    End Method

    Method GetChildren: List<XMLNode>(name: String)
        Debug.TraceNotImplemented("XMLNode.GetChildren(String)")
    End Method

    Method GetChildren: List<XMLNode>(name: String, attributes: String)
        Debug.TraceNotImplemented("XMLNode.GetChildren(String, String)")
    End Method

    Method GetChildrenWithAttributes: List<XMLNode>(attributes: String)
        Debug.TraceNotImplemented("XMLNode.GetChildrenWithAttributes(String)")
    End Method

    Method GetXMLAttribute: XMLAttribute(id: String)
        Debug.TraceNotImplemented("XMLNode.GetXMLAttribute(Int)")
    End Method

    Method HasAttribute: Bool(id: String)
        Debug.TraceNotImplemented("XMLNode.HasAttribute(String)")
    End Method

    Method IsValid: Bool() Property
        Return Self.valid
    End Method

    Method Name: String() Property
        Return Self.name
    End Method

    Method NullNode: XMLNode() Property
        Return Self.doc.nullNode
    End Method

    Method RemoveAttribute: Void(id: String)
        Debug.TraceNotImplemented("XMLNode.RemoveAttribute(String)")
    End Method

    Method RemoveChild: Void(child: XMLNode)
        Debug.TraceNotImplemented("XMLNode.RemoveChild(XMLNode)")
    End Method

    Method SetAttribute: Void(id: String)
        Debug.TraceNotImplemented("XMLNode.SetAttribute(String)")
    End Method

    Method SetAttribute: Void(id: String, value: Bool)
        Debug.TraceNotImplemented("XMLNode.SetAttribute(String, Bool)")
    End Method

    Method SetAttribute: Void(id: String, value: Int)
        Debug.TraceNotImplemented("XMLNode.SetAttribute(String, Int)")
    End Method

    Method SetAttribute: Void(id: String, value: Float)
        Debug.TraceNotImplemented("XMLNode.SetAttribute(String, Float)")
    End Method

    Method SetAttribute: Void(id: String, value: String)
        Debug.TraceNotImplemented("XMLNode.SetAttribute(String, Int)")
    End Method

    Method Value: String() Property
        Return Self.value
    End Method

End Class

Class XMLDoc Extends XMLNode

    Function _EditorFix: Void() End

    Method New(name: String, version: String, encoding: String)
        Debug.TraceNotImplemented("XMLDoc.New(String, String, String)")
    End Method

    Field nullNode: XMLNode
    Field version: String
    Field encoding: String
    Field paths: StringMap = New StringMap()

    Method Export: String(options: Int)
        Debug.TraceNotImplemented("XMLDoc.Export(Int)")
    End Method

End Class

Class XMLAttribute

    Function _EditorFix: Void() End

    Method New(id: String, value: String)
        Debug.TraceNotImplemented("XMLAttribute.New(String, String)")
    End Method

    Field value: String
    Field id: String

End Class

Class XMLStringBuffer

    Function _EditorFix: Void() End

    Field chunk: Int
    Field count: Int
    Field data: Int[]
    Field dirty: Int
    Field cache: String

    Method Add: Void(asc: Int)
        Debug.TraceNotImplemented("XMLStringBuffer.Add(Int)")
    End Method

    Method Add: Void(text: String)
        Debug.TraceNotImplemented("XMLStringBuffer.Add(String)")
    End Method

    Method Add: Void(text: String, offset: Int, suggestedLength: Int)
        Debug.TraceNotImplemented("XMLStringBuffer.Add(String, Int, Int)")
    End Method

    Method Clear: Void()
        Debug.TraceNotImplemented("XMLStringBuffer.Clear()")
    End Method

    Method Last: Int(defaultValue: Int)
        Debug.TraceNotImplemented("XMLStringBuffer.Last(Int)")
    End Method

    Method Trim: Bool()
        Debug.TraceNotImplemented("XMLStringBuffer.Trim()")
    End Method

    Method value: String()
        Debug.TraceNotImplemented("XMLStringBuffer.value()")
    End Method

End Class

Class XMLError

    Function _EditorFix: Void() End

    Field err: Bool
    Field message: String
    Field line: Int
    Field column: Int
    Field offset: Int

    Method Reset: Void()
        Debug.TraceNotImplemented("XMLError.Reset()")
    End Method

    Method Set: Void(message: String, line: Int, column: Int, offset: Int)
        Debug.TraceNotImplemented("XMLError.Set(String, Int, Int, Int)")
    End Method

    Method ToString: String()
        Debug.TraceNotImplemented("XMLError.ToString()")
    End Method

End Class

Class XMLAttributeQueryItem

    Function _EditorFix: Void() End

    Method New(id: String, value: String, required: Bool, special: Bool)
        Debug.TraceNotImplemented("XMLAttributeQueryItem.New(String, String, Bool, Bool)")
    End Method

    Field id: String
    Field value: String
    Field required: Bool
    Field special: Bool

End Class

Class XMLAttributeQuery

    Function _EditorFix: Void() End

    Method New(query: String)
        Debug.TraceNotImplemented("XMLAttributeQuery.New(String)")
    End Method

    Field count: Int
    Field items: XMLAttributeQueryItem[]
    Field chunk: Int

    Method Test: Bool(node: XMLNode)
        Debug.TraceNotImplemented("XMLAttributeQuery.Test(XMLNode)")
    End Method

End Class
