'Strict

Import entity
Import familiar_fixed
Import logger

Class SoulFamiliar Extends FamiliarFixed

    Global allSouls: Object
    Global hasPlayedAttackThisFrame: Bool

    Function CanAttackEnemy: Bool(e: Object)
        Debug.TraceNotImplemented("SoulFamiliar.CanAttackEnemy(Object)")
    End Function

    Function GetSoulAt: Object(x: Int, y: Int)
        Debug.TraceNotImplemented("SoulFamiliar.GetSoulAt(Int, Int)")
    End Function

    Function ResetSoulMovement: Void()
        Debug.TraceNotImplemented("SoulFamiliar.ResetSoulMovement()")
    End Function

    Function _EditorFix: Void() End

    Method New(newX: Int, newY: Int, owner_: Object)
        Debug.TraceNotImplemented("SoulFamiliar.New(Int, Int, Object)")
    End Method

    Field muteAudio: Bool
    Field spawnedOnBeat: Int

    Method Die: Void()
        Debug.TraceNotImplemented("SoulFamiliar.Die()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SoulFamiliar.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method MoveTo: Void(newX: Int, newY: Int)
        Debug.TraceNotImplemented("SoulFamiliar.MoveTo(Int, Int)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SoulFamiliar.Update()")
    End Method

End Class
