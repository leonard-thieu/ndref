'Strict

Import item
Import logger
Import player_class
Import sprite

Class Bomb Extends Item

    Global bombList: Object
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

    Method New(xVal: Int, yVal: Int, dropper: Object, playLitSound: Bool, big: Bool, dmgSource: Int)
        Debug.TraceNotImplemented("Bomb.New(Int, Int, Object, Bool, Bool, Int)")
    End Method

    Field player: Player
    Field isBig: Bool
    Field damageSource: String
    Field beatsUntilExplosion: Int
    Field explosionImg: Sprite
    Field exploded: Bool
    Field allowSelfHits: Bool
    Field bombDamage: Int
    Field explosionFrameCounter: Int
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
