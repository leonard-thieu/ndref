'Strict

Import enemy
Import familiar_fixed
Import logger
Import renderableobject
Import sprite

Class Dove Extends FamiliarFixed

    Function _EditorFix: Void() End

    Method New(x_: Int, y_: Int)
        Super.New()

        Self.image = New Sprite("entities/familiar_dove.png", 12, 11, 4)
        Self.hasSilhouette = False

        Self.Init(x_, y_, 3)
    End Method

    Method ApplyEffect: Bool(dir: Int)
        Local enemy := Enemy.GetEnemyAt(Self.x, Self.y, True)
        If enemy <> Null And
           Not enemy.isCrate
            RenderableObject.HitTile("DOVE FAMILIAR", Self.x, Self.y, 0, dir, Self.owner, False, False, False, False, False)

            Return True
        End If

        Return False
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Dove.Update()")
    End Method

End Class
