'Strict

Import monkey.map
Import enemy
Import entity
Import logger
Import mole_dirt
Import point

Class Fortissimole Extends Enemy

    Function SpawnFans: Void()
        Debug.TraceNotImplemented("Fortissimole.SpawnFans()")
    End Function

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Debug.TraceNotImplemented("Fortissimole.New(Int, Int, Int)")
    End Method

    Field yOffOffstage: Int
    Field yOffOnstage: Int
    Field paceDir: Int
    Field imageOnStage: Bool
    Field onstageState: Int
    Field spawnArmsOffset: Int
    Field jumpingOffstage: Bool
    Field currentDirt: MoleDirt
    Field isBurrowed: Bool
    Field queuedDestage: Bool
    Field queuedPrep: Bool
    Field destageVia: Point
    Field paceParity: Bool
    Field offstageState: Int
    Field spawnMap: IntMap<Object>
    Field summonCount: Int

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Fortissimole.CanBeDamaged(Bool, Bool)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Fortissimole.Die()")
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
        Debug.TraceNotImplemented("Fortissimole.UnoccupyDirt()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Fortissimole.Update()")
    End Method

End Class
