'Strict

Import familiar_fixed
Import logger
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
        Debug.TraceNotImplemented("Dove.ApplyEffect(Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Dove.Update()")
    End Method

End Class
