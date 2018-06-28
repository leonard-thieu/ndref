'Strict

Import monkey.list
Import mojo.graphics
Import entity
Import logger
Import sprite

Class CrystalShards Extends Entity

    Global shardsList: List<CrystalShards> = New List<CrystalShards>()

    Function AnyAt: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("CrystalShards.AnyAt(Int, Int)")
    End Function

    Function MoveAll: Void()
        Debug.TraceNotImplemented("CrystalShards.MoveAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Super.New()

        CrystalShards.shardsList.AddLast(Self)

        Self.image = New Sprite("entities/crystal_shards.png", 24, 24, 2, Image.DefaultFlags)
        Self.image.SetZOff(-19.0)
    End Method

    Field fadeBeats: Int = 2

    Method Die: Void()
        Debug.TraceNotImplemented("CrystalShards.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("CrystalShards.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Move: Void()
        Debug.TraceNotImplemented("CrystalShards.Move()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("CrystalShards.Render()")
    End Method

End Class
