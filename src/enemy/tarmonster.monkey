'Strict

Import controller.controller_game
Import enemy
Import enemy.enemyclamper
Import level
Import audio2
Import entity
Import logger
Import player_class
Import point
Import sprite
Import tile
Import trap
Import util

Class TarMonster Extends EnemyClamper

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "tarmonster")

        Self.stealth = True

        Local tarMonsterNode := Enemy.GetEnemyXML("tarmonster", l)
        Local spritesheetNode := tarMonsterNode.GetChild("spritesheet")
        Local path := spritesheetNode.value
        Local frameW := spritesheetNode.GetAttribute("frameW", 0)
        Local frameH := spritesheetNode.GetAttribute("frameH", 0)
        Local numFrames := spritesheetNode.GetAttribute("numFrames", 1)
        Self.image2 = New Sprite(path, frameW, frameH, numFrames)
        Self.image2.SetFrame(2)

        Self.homeX = xVal
        Self.homeY = yVal

        Self.overrideAttackSound = "tarMonsterAttack"
        Self.overrideDeathSound = "tarMonsterDeath"
        Self.overrideMoveSound = "tarMonsterChase"

        Self.startingCoinsToDrop = Self.coinsToDrop
    End Method

    Field image2: Sprite
    Field homeX: Int
    Field homeY: Int
    Field startingCoinsToDrop: Int
    Field hasMoved: Bool
    Field clampedOnto: Player

    Method AttemptClamp: Void()
        Debug.TraceNotImplemented("TarMonster.AttemptClamp()")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("TarMonster.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        If Self.clampedOnto <> Null And
           Self.clampedOnto.clampedEnemy = Self
            Self.clampedOnto.clampedEnemy = Null
        End If

        If Self.enableDeathEffects
            If Not Level.IsExitAt(Self.x, Self.y) And
               Level.IsFloorAt(Self.x, Self.y)
                Level.PlaceTileRemovingExistingTiles(Self.x, Self.y, TileType.Tar)

                Local trapAtDeath := Trap.GetTrapAt(Self.x, Self.y)
                If trapAtDeath <> Null And
                   Not trapAtDeath.indestructible
                    trapAtDeath.Die()
                End If
            End If
        End If

        Super.Die()
    End Method

    Method DislodgeAttempt: Bool()
        Debug.TraceNotImplemented("TarMonster.DislodgeAttempt()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("TarMonster.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("TarMonster.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("TarMonster.MoveSucceed(Bool, Bool)")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("TarMonster.PerformMovement(Int, Int)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("TarMonster.Render()")
    End Method

    Method Update: Void()
        Local distToClosestPlayer := Util.GetDistFromClosestPlayer(Self.x, Self.y, True)

        If distToClosestPlayer <= 1.0 And
           Self.stealth
            Self.currentMoveDelay = 2
            If Enemy.EnemiesHaveMovedClosestBeat() Or
               (Audio.IsFixedBeatSet() And
                Not controller_game.incrementFixedBeatNum)
                Self.currentMoveDelay = 1
            End If

            Self.stealth = False
            Self.moveTween = 1
            Self.moveShadowTween = 2

            Audio.PlayGameSoundAt("tarMonsterCry", Self.x, Self.y, True, -1, False)
        End If

        If Self.clampedOn
            If Self.x <> Self.clampedOnto.x And
               Self.y <> Self.clampedOnto.y
                Self.x = Self.clampedOnto.x
                Self.y = Self.clampedOnto.y
            End If

            If Self.clampedOnto <> Null And
               Self.clampedOnto.Perished
                Self.clampedOn = False
                Self.clampedOnto = Null
                Self.animOverride = 0
                Self.stealth = True
                Self.yOff = 8.0
                Self.coinsToDrop = Self.startingCoinsToDrop
                Self.health = 1
                Self.healthMax = 1
            End If
            
            Self.animOverride = 3
            Self.image.SetZOff(-20.0)
        Else If Not Self.stealth Or
                Level.isLevelEditor
            If Audio.IsBeatAnimTime(False, False)
                Self.animOverride = 0
            Else
                Self.animOverride = 1
            End If
        Else If distToClosestPlayer <= 2.5
            Self.animOverride = 4
            Self.shadow.SkipNextDraw()
        Else
            Self.image.SkipNextDraw()
            Self.image2.SkipNextDraw()
            Self.shadow.SkipNextDraw()
        End If

        Super.Update()
    End Method

End Class
