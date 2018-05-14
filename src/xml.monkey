'Strict

Import monkey.list
Import monkey.map
Import logger

Class Char
    Const Space: Int = 32
    Const Tab: Int = 9
    Const NewLine: Int = 10
    Const CarriageReturn: Int = 13
    Const LessThan: Int = 60
    Const GreaterThan: Int = 62
    Const SingleQuote: Int = 39
    Const DoubleQuote: Int = 34
    Const Slash: Int = 47
    Const QuestionMark: Int = 63
    Const Equal: Int = 61
    Const Underscore: Int = 0
    Const Dash: Int = 0
    Const Number0: Int = 0
    Const Number9: Int = 0
    Const A: Int = 0
    Const Z: Int = 0
    Const a: Int = 0
    Const z: Int = 0
End Class

Function ParseXML: XMLDoc(raw: String, error: XMLError, options: Int)
    Const XMLDeclarationStart := "<?xml"
    Const XMLCommentStart := "<!--"
    Const XMLCommentEnd := "-->"
    Const CDATAStart := "<![CDATA["
    Const CDATAEnd := "]]>"

    Local buffer1 := New XMLStringBuffer()
    Local buffer2 := New XMLStringBuffer()
    Local nodes := New List<XMLNode>()

    If error <> Null
        error.Reset()
    End If

    Local isValidNode: Bool
    Local node: XMLNode
    Local lastNode: XMLNode
    Local lastChar: Int
    Local line := 1
    Local column := 1
    Local offset: Int
    Local hasXMLDeclaration: Bool
    Local charsConsumed: Int
    Local inXMLDeclaration: Bool
    Local v107: Bool
    Local readSlash: Bool
    Local v126: Bool
    Local createdNode: Bool
    Local doc: XMLDoc
    Local v125: Bool
    Local readEqual: Bool
    Local v109: Bool
    Local foundCloseBracket: Bool
    Local v135: Bool
    Local v22: Bool
    Local version: String
    Local encoding: String

    Local rawChars := raw.ToChars()

    For Local char := EachIn rawChars
        If Not isValidNode
            Select char
                Case Char.Space,
                     Char.Tab
                    If buffer1.Length() <> 0 Or
                       (lastNode <> Null And lastNode.value.Length() <> 0)
                        lastChar = buffer1.Last(-1)

                        If Not (options & 1) Or
                           (buffer1.Length() <> 0 And
                            lastChar <> Char.Space And
                            lastChar <> Char.Tab)
                            If lastNode = Null
                                If error <> Null
                                    error.Set("illegal character", line, column, offset)
                                End If

                                Return Null
                            End If
                            
                            buffer1.Add(char)
                        End If
                    End If

                    column += 1
                    'goto BEFORE_END_OF_LOOP
                Case Char.NewLine
                    line += 1
                    column = 1
                    'goto BEFORE_END_OF_LOOP
                Case Char.CarriageReturn
                    'goto BEFORE_END_OF_LOOP
                Case Char.GreaterThan
                    If error <> Null
                        error.Set("unexpected close bracket", line, column, offset)
                    End If

                    Return Null
                Case Char.LessThan
                    Local xmlDeclarationStartIndex := raw.Find(XMLDeclarationStart, offset)
                    If xmlDeclarationStartIndex <> -1
                        If hasXMLDeclaration
                            If error <> Null
                                error.Set("duplicate xml format", line, column, offset)
                            End If

                            Return Null
                        End If

                        column += XMLDeclarationStart.Length()
                        offset += XMLDeclarationStart.Length()
                        inXMLDeclaration = True
                        'goto BEFORE_END_OF_LOOP
                    End If

                    Local xmlCommentStartIndex := raw.Find(XMLCommentStart, offset)
                    If xmlCommentStartIndex <> -1
                        Local xmlCommentOffsetStart := xmlCommentStartIndex + XMLCommentStart.Length()
                        Local xmlCommentEndIndex := raw.Find(XMLCommentEnd, xmlCommentOffsetStart)
                        If xmlCommentEndIndex = -1
                            If error <> Null
                                error.Set("comment not closed", line, column, offset)
                            End If

                            Return Null
                        End If

                        Local xmlCommentOffsetEnd := xmlCommentEndIndex - 1
                        For Local i := xmlCommentOffsetStart To xmlCommentOffsetEnd
                            column += 1

                            If raw[i] = Char.NewLine
                                line += 1
                                column = 0
                            End If
                        End For

                        offset = xmlCommentEndIndex + XMLCommentEnd.Length()
                        'goto BEFORE_END_OF_LOOP
                    End If

                    Local cdataStartIndex := raw.Find(CDATAStart, offset)
                    If cdataStartIndex <> -1
                        Local cdataOffsetStart := cdataStartIndex + CDATAStart.Length()
                        Local cdataEndIndex := raw.Find(CDATAEnd, cdataOffsetStart)
                        If cdataEndIndex = -1
                            If error <> Null
                                error.Set("cdata not closed", line, column, offset)
                            End If

                            Return Null
                        End If

                        If lastNode = Null
                            If error <> Null
                                error.Set("unexepcted cdata", line, column, offset)
                            End If

                            Return Null
                        End If

                        Local cdataOffsetEnd := cdataEndIndex - 1
                        Local cdata := raw[cdataOffsetStart..cdataOffsetEnd]
                        buffer1.Add(cdata)

                        offset = cdataEndIndex + CDATAEnd.Length()
                        'goto BEFORE_END_OF_LOOP
                    End If

                    If buffer1.Length() <> 0
                        If Not (options & 1)
                            ' TODO: Is this `node` or `lastNode`?
                            node.value = buffer1.value()
                            buffer1.Clear()
                        Else
                            buffer1.Trim()
                            If buffer1.Length() <> 0
                                ' TODO: Is this `node` or `lastNode`?
                                node.value = buffer1.value()
                                buffer1.Clear()
                            End If
                        End If
                    End If

                    isValidNode = True
                    column += 1
                    'goto BEFORE_END_OF_LOOP
                Default
                    If lastNode = Null
                        If error <> Null
                            error.Set("illegal character", line, column, offset)
                        End If

                        Return Null
                    End If

                    buffer1.Add(char)

                    column += 1
                    'goto BEFORE_END_OF_LOOP
            End Select
        End If

        If Not v107
            Exit
        End If

        Select char
            Case Char.Tab
                column += 1
                'goto BEFORE_END_OF_LOOP
            Case Char.NewLine
                line += 1
                column = 1
                'goto BEFORE_END_OF_LOOP
            Case Char.CarriageReturn
                'goto COPY_RAW_LENGTH
            Case Char.Space
                column += 1
                'goto BEFORE_END_OF_LOOP
            Case Char.GreaterThan
                'LABEL_27
                If inXMLDeclaration
                    hasXMLDeclaration = True
                Else if readSlash
                    If v126
                        v126 = False
                    Else
                        If buffer1.Length() <> 0
                            ' TODO: Is this `node` or `lastNode`?
                            node.value = buffer1.value()
                            buffer1.Clear()
                        End If

                        nodes.RemoveLast()
                        lastNode = Null

                        If Not nodes.IsEmpty()
                            lastNode = nodes.Last()
                        End If
                    End If
                Else
                    nodes.AddLast(node)
                    lastNode = node
                    node = Null
                End If

                offset += 1
                isValidNode = False
                v107 = False
                readSlash = False
                createdNode = False
                inXMLDeclaration = False

                If offset >= raw.Length()
                    'CHECK_IF_VALID
                    If Not isValidNode And
                       lastNode = Null And
                       doc <> Null
                        Return doc
                    End If

                    If error <> Null
                        error.Set("unexpected end of xml", line, column, offset)

                        Return Null
                    End If
                End If

                'END_OF_LOOP
            Default
                If error <> Null
                    error.Set("unexpected character", line, column, offset)
                End If

                Return Null
        End Select
    End For

    Local char: Int

    If v125
        If lastChar <> char
            buffer2.Add(raw[offset])
            'COPY_RAW
            'COPY_RAW_LENGTH
            'BEFORE_END_OF_LOOP
            offset += 1
            If offset >= raw.Length()
                'goto CHECK_IF_VALID
            End If
            'goto END_OF_LOOP
        End If

        v125 = False
        'goto LABEL_75
    End If

    Select char
        Case Char.Tab

        Case Char.NewLine
            line += 1
            column = 1

            If buffer2.Length() = 0
                'goto COPY_RAW
            End If
            'goto LABEL_75
        Case Char.CarriageReturn
            'goto COPY_RAW
        Case Char.SingleQuote,
             Char.DoubleQuote
            If readSlash Or
               (Not createdNode And Not inXMLDeclaration) Or
               Not readEqual Or
               buffer2.Length() <> 0
                If error <> Null
                    error.Set("unexpected quote", line, column, offset)
                End If

                Return Null
            End If

            column += 1
            lastChar = char
            v125 = True

            If buffer2.Length() = 0
                'goto COPY_RAW
            End If
        Case Char.Slash
            If readSlash Or
               readEqual
                If error <> Null
                    error.Set("unexpected slash", line, column, offset)
                End If

                Return Null
            End If

            v107 = False
            If createdNode
                v107 = True
                v126 = True
            End If

            column += 1
            readSlash = True
            v109 = False
            foundCloseBracket = False
            'goto CHECK_v109
        Case Char.GreaterThan
            If readEqual Or
               (Not createdNode And buffer2.Length() = 0)
                If error <> Null
                    error.Set("unexpected close bracket", line, column, offset)
                End If

                Return Null
            End If

            v109 = False
            column += 1
            foundCloseBracket = True
        Case Char.QuestionMark
            If Not inXMLDeclaration Or
               (raw.Length() - 1 = offset) Or
               (rawChars[offset + 1] <> Char.GreaterThan)
                If error <> Null
                    error.Set("unexpected questionmark", line, column, offset)
                End If

                Return Null
            End If

            column += 1
            offset += 1
            'goto LABEL_27
        Case Char.Equal
            column += 1

            If readSlash Or
               (Not createdNode And Not inXMLDeclaration) Or
               readEqual Or
               v135 Or
               buffer2.Length() = 0
                If error <> Null
                    error.Set("unexpected equals", line, column, offset)
                End If

                Return Null
            End If

            readEqual = True
            'goto LABEL_75
        Case Char.Space

        Default
            If char = Char.Underscore Or
               char = Char.Dash Or
               (Char.Number0 <= char And char <= Char.Number9) Or
               (Char.A <= char And char <= Char.Z) Or
               (Char.a <= char And char <= Char.z)
                If readSlash And
                   createdNode
                    If error <> Null
                        error.Set("unexpected character", line, column, offset)
                    End If
                End If

                If v135
                    v109 = True
                End If

                If Not v135 Or
                   readEqual
                    buffer2.Add(char) ' TODO: Double check
                    v109 = False
                End If

                column += 1
                foundCloseBracket = False
            Else
                If error <> Null
                    error.Set("illegal character", line, column, offset)
                End If

                Return Null
            End If

            'CHECK_v109
            If Not v109
                'goto CHECK_v109_2
            End If
            'goto LABEL_76
    End Select

    'LABEL_75
    v109 = False
    foundCloseBracket = False

    'LABEL_76
    If createdNode Or
       inXMLDeclaration
        Local value: String
        Local id: String

        If v135
            value = buffer2.value()
            v22 = True
        Else
            id = buffer2.value()
            v22 = False
        End If

        If Not foundCloseBracket And
           Not v22 And
           Not v109
            v135 = True
        End If

        If foundCloseBracket Or
           v22 Or
           v109 Or
           readSlash
            If inXMLDeclaration
                ' TODO: Check if `version` or `encoding` and then do nothing?
            Else
                node.SetAttribute(id, value)
            End If

            readEqual = False
            v135 = False
        End If
    Else If readSlash
        Local name := buffer2.value()
        If lastNode = Null Or
           name <> lastNode.name
            If error <> Null
                error.Set("mismatched end tag", line, column, offset)
            End If

            Return Null
        End If

        v107 = True
        createdNode = True
    Else
        If lastNode <> Null
            Local name := buffer2.value()
            lastNode.AddChild(name, "")
        Else
            If doc <> Null
                If error <> Null
                    error.Set("duplicate root", line, column, offset)
                End If

                Return Null
            End If

            Local name := buffer2.value()
            doc = New XMLDoc(name, version, encoding)
            doc.doc = doc
            doc.parent = Null
            doc.line = line
            doc.column = column
            doc.offset = offset

            createdNode = True
            node = doc
        End If
    End If

    buffer2.Clear()

    'CHECK_v109_2
    If v109
        buffer2.Add(char)
    End If

    If Not foundCloseBracket
        'goto COPY_RAW
    End If
    'goto LABEL_27

    column += 1
    If buffer2.Length() = 0
        'goto COPY_RAW
    End If
    'goto LABEL_75

    line = 1
    offset = 0
    column = 1

    'UNEXPECTED_END_OF_XML
    If error <> Null
        error.Set("unexpected end of xml", line, column, offset)
    End If

    Return Null
End Function

Class XMLNode

    Function _EditorFix: Void() End

    Method New(name: String, valid: Bool)
        If name.Length() <> 0
            Self.name = name
        End If

        Self.valid = valid
    End Method

    Field firstChild: XMLNode
    Field doc: XMLDoc
    Field name: String
    Field nextSibling: XMLNode
    Field attributes: StringMap = New StringMap()
    Field value: String
    Field children: List<XMLNode> = New List<XMLNode>()
    Field valid: Bool
    Field path: String
    Field pathList: List<XMLNode>
    Field parent: XMLNode
    Field line: Int
    Field column: Int
    Field offset: Int
    Field lastChild: XMLNode
    Field previousSibling: XMLNode

    Method AddChild: XMLNode(name: String, attributes: String)
        Debug.TraceNotImplemented("XMLNode.AddChild(String, String)")
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

    Method New(name: String, version: String, encoding: String)
        Debug.TraceNotImplemented("XMLDoc.New(String, String, String)")
    End Method

    Field nullNode: XMLNode
    Field version: String
    Field encoding: String
    Field paths: StringMap<List<XMLNode>> = New StringMap<List<XMLNode>>()

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

    Method Length: Int()
        Debug.TraceNotImplemented("XMLStringBuffer.Length()")
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

    Method Set: Void(message: String, line: Int, column: Int, offset: Int)
        Debug.TraceNotImplemented("XMLError.Set(String, Int, Int, Int)")
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
