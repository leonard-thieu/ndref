'Strict

Import monkey.list
Import mojo.graphics
Import item
Import logger
Import player_class
Import sprite

Class Bomb Extends Item

    Global bombList: List<Bomb> = New List<Bomb>()
    Global curExplosionKills: Int

    Function GenerateExplosionDamage: Void(tmpX: Int, tmpY: Int, source: Int, dam: Int, p: Object, big: Bool, allowSelfHits: Bool)
        Debug.TraceNotImplemented("Bomb.GenerateExplosionDamage(Int, Int, Int, Int, Object, Bool, Bool)")
    End Function

    Function GetHittableBombAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Bomb.GetHittableBombAt(Int, Int)")
    End Function

    Function GetUnexplodedBombAt: Object(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Bomb.GetUnexplodedBombAt(Int, Int)")
    End Function

    Function KickBombAtPlayer: Void(x: Int, y: Int)
        Debug.TraceNotImplemented("Bomb.KickBombAtPlayer(Int, Int)")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, dropper: Player, playLitSound: Bool, big: Bool, dmgSource: String)
        Super.New(xVal, yVal, "bomb", False, -1, False)

        Self.pickupable = False

        Self.player = dropper
        Self.isBig = big
        Self.beatsUntilExplosion = 3
        Self.damageSource = dmgSource

        Self.explosionImg = New Sprite("items/3x3_explosion.png", 8, Image.DefaultFlags)
        Self.explosionImg.SetZOff(1000.0)

        If playLitSound
            Debug.TraceNotImplemented("Bomb.New(Int, Int, Player, Bool, Bool, String) (Audio)")
        End If

        Bomb.bombList.AddLast(Self)
    End Method

    Field player: Player
    Field isBig: Bool
    Field damageSource: String = "bomb"
    Field beatsUntilExplosion: Int = -1
    Field explosionImg: Sprite
    Field exploded: Bool
    Field allowSelfHits: Bool = True
    Field bombDamage: Int = 4
    Field explosionFrameCounter: Int = 3
    Field explosionFrame: Int

    Method Die: Void()
        Debug.TraceNotImplemented("Bomb.Die()")
    End Method

    Method Explode: Void()
        Debug.TraceNotImplemented("Bomb.Explode()")
    End Method

    Method HitInDirection: Void(dir: Int, maxSteps: Int)
        Debug.TraceNotImplemented("Bomb.HitInDirection(Int, Int)")
    End Method

    Method IsVisible: Bool()
        Debug.TraceNotImplemented("Bomb.IsVisible()")
    End Method

    Method JumpTo: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Bomb.JumpTo(Int, Int)")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("Bomb.Move()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Bomb.Render()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Bomb.Update()")
    End Method

End Class
