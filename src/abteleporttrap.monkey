'Strict

Import logger
Import trap

Class ABTeleportTrap Extends Trap

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int)
        Super.New()

        ' NOTE: Doesn't set itself to `TrapType.ABTeleportTrap` even though it exists.
        Self.trapType = TrapType.TeleportTrap

        Self.x = xVal
        Self.y = yVal
        Self.xOff = 5.0
        Self.yOff = 15.0

        Self.image = New Sprite("traps/ab_teleporttrap.png", 14, 16, 4, Image.DefaultFlags)
        Self.image.SetZOff(-995.0)
    End Method

    Field pairedTrap: ABTeleportTrap
    Field retractCounter: Int

End Class
