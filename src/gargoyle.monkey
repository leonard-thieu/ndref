'Strict

Import mojo.graphics
Import bouncer
Import controller_game
Import crate
Import enemy
Import entity
Import level
Import logger
Import necrodancer_enemy
Import player_class
Import point
Import sprite

Class Gargoyle Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        If l = 5
            If controller_game.currentLevel = 3
                l = 6
            Else If Necrodancer.necrodancer <> Null
                l = 7
            End If
        End If

        Self.Init(xVal, yVal, l, "gargoyle")

        If Self.level = 1
            Self.gustImage = New Sprite("particles/wind_gust.png", 7, Image.MidHandle)
        End If

        If Self.level >= 5 And
           Level.randSeed <> -1
            Self.DetermineContents()
        End If

        Self.isCrate = True
        Self.containsItem = True

        Self.overrideAttackSound = "gargoyleAttack"
        Self.overrideDeathSound = "gargoyleDeath"
    End Method

    Field gustImage: Sprite
    Field determinedContents: Bool
    Field contents: String
    Field hasMoved: Bool
    Field active: Bool
    Field playerGusted: Player
    Field animStartAt: Int
    Field image2: Sprite
    Field bounce2: Bouncer

    Method DetermineContents: Void()
        If Not Self.determinedContents And
           Self.level <> 7
            Self.contents = Crate.SelectItem(controller_game.currentLevel)
            Self.determinedContents = True
        End If
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Gargoyle.Die()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Gargoyle.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Gargoyle.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Gargoyle.MoveSucceed(Bool, Bool)")
    End Method

    Method OpenAsCrate: Void(enemyOK: Bool)
        Debug.TraceNotImplemented("Gargoyle.OpenAsCrate(Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Gargoyle.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Gargoyle.Update()")
    End Method

End Class
