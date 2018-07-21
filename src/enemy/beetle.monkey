'Strict

Import enemy
Import level
Import audio2
Import entity
Import logger
Import util

Class Beetle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "beetle")

        Self.overrideHitSound = "beetleHit"
        Self.overrideAttackSound = "beetleAttack"
        Self.overrideDeathSound = "beetleDeath"

        Self.swarmCulprit = True
    End Method

    Field hasArmor: Bool = True

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Beetle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Beetle.MoveImmediate(Int, Int, String)")
    End Method

    Method Update: Void()
        If Self.hasArmor And
           Util.GetDistFromClosestPlayer(Self.x, Self.y, True) <= 1.0
            Self.hasArmor = False

            Audio.PlayGameSoundAt("beetleDrop", Self.x, Self.y, False, -1, False)

            Select Self.level
                Case 1
                    Level.PlaceHotCoalTileAt(Self.x, Self.y)
                Default
                    Level.PlaceIceTileAt(Self.x, Self.y)
            End Select
        End If

        If Not Self.hasArmor
            Self.animOverrideState = 4
            Self.animOverride = Audio.GetBeatAnimFrame4()
        End If

        Super.Update()
    End Method

End Class
