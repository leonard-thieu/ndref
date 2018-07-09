'Strict

Import logger
Import sprite
Import trap

Class DecorativeFireTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New(xVal, yVal, TrapType.DecorativeFireTrap)

        Self.xOff = 2.0
        Self.yOff = -36.0

        Self.image = New Sprite("traps/firetrap_decorative.png", 21, 54, 8)
        Self.image.SetZOff(80.0)
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("DecorativeFireTrap.Update()")
    End Method

End Class
