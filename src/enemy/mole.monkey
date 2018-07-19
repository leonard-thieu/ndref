'Strict

Import enemy
Import level
Import entity
Import audio2
Import logger
Import mole_dirt
Import particles
Import player_class
Import point
Import tile
Import util

Class Mole Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "mole")

        Self.animOverride = False

        Self.overrideAttackSound = "moleAttack"
        Self.overrideDeathSound = "moleDeath"

        If Not Level.isLevelEditor
            Self.PutDirt()
        End If

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field currentDirt: MoleDirt
    Field wasBurrowed: Bool
    Field isBurrowed: Bool = True

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Mole.CanBeDamaged(Bool, Bool)")
    End Method

    Method Delete: Void()
        Self.UnoccupyDirt()

        Super.Delete()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Mole.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Mole.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Mole.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Mole.MoveSucceed(Bool, Bool)")
    End Method

    Method PutDirt: Void()
        If Self.currentDirt = Null Or
           Self.x <> Self.currentDirt.x Or
           Self.y <> Self.currentDirt.y
            Self.UnoccupyDirt()
            self.currentDirt = New MoleDirt(Self.x, Self.y)
        End If
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Mole.Render()")
    End Method

    Method UnoccupyDirt: Void()
        If Self.currentDirt <> Null
            Self.currentDirt.Unoccupy()
            Self.currentDirt = Null
        End If
    End Method

    Method Update: Void()
        If Level.IsWaterOrTarAt(Self.x, Self.y)
            Level.PlaceTileRemovingExistingTiles(Self.x, Self.y, TileType.Floor)
        End If

        If Self.wasBurrowed And
           Not Self.isBurrowed
            Local particlesX := 24 * (Self.x + 0.5)
            Local particlesY := 24 * (Self.y + 1)
            New ParticleSystem(particlesX, particlesY, ParticleSystemData.MOLE_APPEAR, Direction.None, "")

            Audio.PlayGameSoundAt("molePopout", Self.x, Self.y, False, -1, False)
        End If

        Self.wasBurrowed = Self.isBurrowed

        Super.Update()
    End Method

End Class
