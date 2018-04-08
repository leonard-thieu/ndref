Strict

Import point

Class Rect

    Function _EditorFix: Void() End

    Method GetRight: Int()
        Throw New Throwable()
    End Method
    
    Method GetBottom: Int()
        Throw New Throwable()
    End Method
    
    Method GetCenter: Object()
        Throw New Throwable()
    End Method
    
    Method GetPoints: Object()
        Throw New Throwable()
    End Method
    
    Method RandomPoint: Object()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        GetRight()
        GetBottom()
        GetCenter()
        GetPoints()
        RandomPoint()
    End Method
    
End
