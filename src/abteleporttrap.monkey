'Strict

Import logger
Import trap

Class ABTeleportTrap Extends Trap

    Function _EditorFix: Void() End

    Field pairedTrap: ABTeleportTrap
    Field retractCounter: Int

End Class
