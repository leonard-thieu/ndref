Strict

Import monkey.set
Import intpointmap
Import point

Class IntPointSet Extends Set<Point>

    Function _EditorFix: Void() End

    Method New()
        Super.New(New IntPointMap())
    End Method

End Class
