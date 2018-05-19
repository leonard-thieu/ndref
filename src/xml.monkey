'Strict

Import monkey.list
Import monkey.map
Import logger

Function ParseXML: XMLDoc(raw: String, error: XMLError = Null)
    Debug.TraceNotImplemented("ParseXML(String, XMLError)")
End Function

Class XMLNode

    Function _EditorFix: Void() End

    Method New(name: Int, valid: Bool)
        Debug.TraceNotImplemented("XMLNode.New(Int, Bool)")
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

    Method AddChild: Object(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.AddChild(String, Int)")
    End Method

    Method Export: Void(options: Int, buffer: Object, depth: Int)
        Debug.TraceNotImplemented("XMLNode.Export(Int, Object, Int)")
    End Method

    Method ExportHack: Int(options: Int)
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

    Method GetChild: XMLNode(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChild(String, Int)")
    End Method

    Method GetChildAtPath: XMLNode(path: String)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath(String)")
    End Method

    Method GetChildAtPath: XMLNode(path: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildAtPath(String, Int)")
    End Method

    Method GetChildren: List<XMLNode>()
        Debug.TraceNotImplemented("XMLNode.GetChildren()")
    End Method

    Method GetChildren: List<XMLNode>(name: String)
        Debug.TraceNotImplemented("XMLNode.GetChildren2(String)")
    End Method

    Method GetChildren: List<XMLNode>(name: String, attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildren3(String, Int)")
    End Method

    Method GetChildrenWithAttributes: Object(attributes: Int)
        Debug.TraceNotImplemented("XMLNode.GetChildrenWithAttributes(Int)")
    End Method

    Method GetXMLAttribute: Object(id: Int)
        Debug.TraceNotImplemented("XMLNode.GetXMLAttribute(Int)")
    End Method

    Method HasAttribute: Bool(id: Int)
        Debug.TraceNotImplemented("XMLNode.HasAttribute(Int)")
    End Method

    Method RemoveAttribute: Void(id: Int)
        Debug.TraceNotImplemented("XMLNode.RemoveAttribute(Int)")
    End Method

    Method RemoveChild: Void(child: Object)
        Debug.TraceNotImplemented("XMLNode.RemoveChild(Object)")
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

End Class

Class XMLDoc Extends XMLNode

    Function _EditorFix: Void() End

    Method New(name: Int, version: Int, encoding: Int)
        Debug.TraceNotImplemented("XMLDoc.New(Int, Int, Int)")
    End Method

    Field nullNode: XMLNode
    Field version: String
    Field encoding: String
    Field paths: StringMap2

    Method Export: Int(options: Int)
        Debug.TraceNotImplemented("XMLDoc.Export(Int)")
    End Method

End Class

Class XMLAttribute

    Function _EditorFix: Void() End

    Method New(id: Int, value: Int)
        Debug.TraceNotImplemented("XMLAttribute.New(Int, Int)")
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

    Method value: Int()
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

    Method Set: Void(message: Int, line: Int, column: Int, offset: Int)
        Debug.TraceNotImplemented("XMLError.Set(Int, Int, Int, Int)")
    End Method

    Method ToString: Int()
        Debug.TraceNotImplemented("XMLError.ToString()")
    End Method

End Class

Class XMLAttributeQueryItem

    Function _EditorFix: Void() End

    Method New(id: Int, value: Int, required: Bool, special: Bool)
        Debug.TraceNotImplemented("XMLAttributeQueryItem.New(Int, Int, Bool, Bool)")
    End Method

    Field id: String
    Field value: String
    Field required: Bool
    Field special: Bool

End Class

Class XMLAttributeQuery

    Function _EditorFix: Void() End

    Method New(query: Int)
        Debug.TraceNotImplemented("XMLAttributeQuery.New(Int)")
    End Method

    Field count: Int
    Field items: XMLAttributeQueryItem[]
    Field chunk: Int

    Method Test: Bool(node: Object)
        Debug.TraceNotImplemented("XMLAttributeQuery.Test(Object)")
    End Method

End Class
