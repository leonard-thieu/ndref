'Strict

Import monkey.map
Import controller.controller_game
Import enemy
Import enemy.skeleton
Import level
Import audio2
Import entity
Import logger
Import mole_dirt
Import point
Import shrine
Import util

Class Fortissimole Extends Enemy

    Function HaveSpeakerAt: Bool(xVal: Int)
        Debug.TraceNotImplemented("Fortissimole.HaveSpeakerAt(Int)")
    End Function

    Function SpawnFans: Void()
        Local skeletonLevel := 1
        If controller_game.currentDepth >= 2 skeletonLevel += 1
        If controller_game.currentDepth >= 3 skeletonLevel += 1

        For Local x := -3 To 3
            For Local y := -14 To -13
                If Util.IsGlobalCollisionAt(x, y, False, False, False, False) Then Continue
                If Util.IsAnyPlayerAt(x, y) Then Continue

                Local skeleton := New Skeleton(x, y, skeletonLevel)
                skeleton.isMosh = True
                skeleton.ActivateLight(0.01, 0.02)
            End For
        End For
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "fortissimole")

        Self.yOffOffstage = Self.yOff
        Self.yOffOnstage = Self.yOff - 8.0

        Self.overrideHitSound = "fortissimoleVoHit"
        Self.overrideDeathSound = "fortissimoleVoDeath"

        Self.ActivateLight(0.01, 0.02)

        Self.paceDir = Direction.Right
        If Util.RndBool(True)
            Self.paceDir = Direction.Left
        End If

        Local healthBonus := controller_game.currentDepth - 1
        If Shrine.warShrineActive
            healthBonus = 4
        End If

        Self.healthMax += healthBonus
        Self.health = Self.healthMax
    End Method

    Field yOffOffstage: Int
    Field yOffOnstage: Int
    Field paceDir: Int = Direction.Left
    Field imageOnStage: Bool
    Field onstageState: Int
    Field spawnArmsOffset: Int = -1
    Field jumpingOffstage: Bool
    Field currentDirt: MoleDirt
    Field isBurrowed: Bool
    Field queuedDestage: Bool
    Field queuedPrep: Bool
    Field destageVia: Point = New Point(0, 0)
    Field paceParity: Bool
    Field offstageState: Int
    Field spawnMap: IntMap<Enemy> = New IntMap<Enemy>()
    Field summonCount: Int

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Fortissimole.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        Self.UnoccupyDirt()

        Enemy.SetEnemiesToDropNoCoinsOverride()
        Super.Die()
        Enemy.KillAllEnemies()

        ' SKIPPED: Audio
    End Method

    Method DigFloor: Void()
        Debug.TraceNotImplemented("Fortissimole.DigFloor()")
    End Method

    Method DoSplashDamage: Void()
        Debug.TraceNotImplemented("Fortissimole.DoSplashDamage()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Fortissimole.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Fortissimole.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImmuneToFear: Bool()
        Debug.TraceNotImplemented("Fortissimole.ImmuneToFear()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Fortissimole.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Fortissimole.MoveSucceed(Bool, Bool)")
    End Method

    Method OnStage: Bool()
        Debug.TraceNotImplemented("Fortissimole.OnStage()")
    End Method

    Method PerformMovement: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Fortissimole.PerformMovement(Int, Int)")
    End Method

    Method PopoutSplash: Void()
        Debug.TraceNotImplemented("Fortissimole.PopoutSplash()")
    End Method

    Method PutDirt: Void()
        Debug.TraceNotImplemented("Fortissimole.PutDirt()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Fortissimole.Render()")
    End Method

    Method TrySpawnX: Bool(spawnX: Int)
        Debug.TraceNotImplemented("Fortissimole.TrySpawnX(Int)")
    End Method

    Method UnoccupyDirt: Void()
        If Self.currentDirt <> Null
            Self.currentDirt.Unoccupy()
            Self.currentDirt = Null
        End If
    End Method

    Method Update: Void()
        Self.animOffset = 0
        Self.animOverride = -1

        If Level.IsWallAt(Self.x, Self.y)
            If Not Self.imageOnStage
                Self.shadowYOff -= 8
                Self.yOff = Self.yOffOnstage
                Self.imageOnStage = True

                Self.shadow.UnSetZ()
                Self.shadow.SetZOff(Self.image.zOff + 24.0)

                Self.image.SetZOff(Self.image.zOff + 124.0)
            End If

            Select Self.paceDir
                Case Direction.Right
                    Self.ImageFlipX(True)
                Default
                    Self.ImageFlipX(False)
            End Select

            If Self.onstageState = 1
                Self.animOffset = 7
            Else If Self.spawnArmsOffset <> -1
                Local newSpawnArmsOffset := (Audio.GetBeatAnimFrame4() + 3) Mod 4
                If Self.spawnArmsOffset <= newSpawnArmsOffset And newSpawnArmsOffset <= Self.spawnArmsOffset + 2
                    Self.spawnArmsOffset = newSpawnArmsOffset
                End If

                Self.animOverride = Self.spawnArmsOffset + 22
            End If
        Else
            If Self.imageOnStage
                Self.shadowYOff += 8
                Self.imageOnStage = False

                Self.image.SetZOff(Self.image.zOff - 124.0)

                Self.shadow.SetZOff(0.0)
                Self.shadow.SetZ(-990.0)
            End If

            If Self.yOffOnstage <= Self.yOff
                If Self.jumpingOffstage And
                   Self.image.GetTweenDurationRemaining() = 0
                    Audio.PlayGameSoundAt("fortissimoleLand", Self.x, Self.y, False, -1, False)

                    Self.jumpingOffstage = False

                    Self.PutDirt()
                End If
            Else
                Self.yOff += 1.0
            End If

            Select Audio.GetBeatAnimFrame4()
                Case 0
                    Self.animOverride = 5
                Case 1
                    Self.animOverride = 6
                Case 2,
                     3
                    Self.animOverride = 4
            End Select

            If Self.jumpingOffstage
                Self.animOverride = -1
                Self.animOffset = 0
            End If
        End If

        Super.Update()
    End Method

End Class
