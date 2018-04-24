'Strict

Import logger

Class PlayerHealth

    Function _EditorFix: Void() End

    Field fragile: Bool
    Field bonusMax: Int
    Field cursedMax: Int
    Field baseMax: Int = 4
    Field cursedCurrent: Int
    Field current: Int = 4

    Method ApplyMax: Int()
        Debug.TraceNotImplemented("PlayerHealth.ApplyMax()")
    End Method

    Method CurseAllHearts: Void()
        Debug.TraceNotImplemented("PlayerHealth.CurseAllHearts()")
    End Method

    Method Damage: Void(damage: Int)
        Debug.TraceNotImplemented("PlayerHealth.Damage(Int)")
    End Method

    Method GainBonusHeart: Void()
        Debug.TraceNotImplemented("PlayerHealth.GainBonusHeart()")
    End Method

    Method GainCursedHearts: Void(hearts: Int)
        Debug.TraceNotImplemented("PlayerHealth.GainCursedHearts(Int)")
    End Method

    Method GainHearts: Void(hearts: Int, full: Bool)
        Debug.TraceNotImplemented("PlayerHealth.GainHearts(Int, Bool)")
    End Method

    Method Get: Int()
        Debug.TraceNotImplemented("PlayerHealth.Get()")
    End Method

    Method GetHearts: Int()
        Debug.TraceNotImplemented("PlayerHealth.GetHearts()")
    End Method

    Method GetHeartValue: Int(offset: Int)
        Debug.TraceNotImplemented("PlayerHealth.GetHeartValue(Int)")
    End Method

    Method GetMax: Int()
        Debug.TraceNotImplemented("PlayerHealth.GetMax()")
    End Method

    Method GetNormal: Int()
        Debug.TraceNotImplemented("PlayerHealth.GetNormal()")
    End Method

    Method GetNormalMax: Int()
        Debug.TraceNotImplemented("PlayerHealth.GetNormalMax()")
    End Method

    Method Heal: Bool(amount: Int, allowGluttony: Bool)
        Debug.TraceNotImplemented("PlayerHealth.Heal(Int, Bool)")
    End Method

    Method IsCursedHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("PlayerHealth.IsCursedHeart(Int)")
    End Method

    Method IsEmptyHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("PlayerHealth.IsEmptyHeart(Int)")
    End Method

    Method IsFullHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("PlayerHealth.IsFullHeart(Int)")
    End Method

    Method IsHalfHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("PlayerHealth.IsHalfHeart(Int)")
    End Method

    Method LoseBonusHeart: Void()
        Debug.TraceNotImplemented("PlayerHealth.LoseBonusHeart()")
    End Method

    Method ProcessCurse: Void()
        Debug.TraceNotImplemented("PlayerHealth.ProcessCurse()")
    End Method

    Method Refill: Void()
        Debug.TraceNotImplemented("PlayerHealth.Refill()")
    End Method

    Method RefillAsCursed: Void()
        Debug.TraceNotImplemented("PlayerHealth.RefillAsCursed()")
    End Method

    Method RefillTo: Void(amount: Int)
        Debug.TraceNotImplemented("PlayerHealth.RefillTo(Int)")
    End Method

    Method Reset: Void(newMax: Int)
        Debug.TraceNotImplemented("PlayerHealth.Reset(Int)")
    End Method

    Method ResetFragile: Void()
        Debug.TraceNotImplemented("PlayerHealth.ResetFragile()")
    End Method

    Method Revive: Void()
        Debug.TraceNotImplemented("PlayerHealth.Revive()")
    End Method

End Class
