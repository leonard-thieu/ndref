'Strict

Import logger

Class PlayerHealth

    Function _EditorFix: Void() End

    Field fragile: Bool
    Field bonusMax: Int
    Field cursedMax: Int
    Field baseMax: Int
    Field cursedCurrent: Int
    Field current: Int

    Method ApplyMax: Int()
        Debug.TraceNotImplemented("TextSprite.ApplyMax()")
    End Method

    Method CurseAllHearts: Void()
        Debug.TraceNotImplemented("TextSprite.CurseAllHearts()")
    End Method

    Method Damage: Void(damage: Int)
        Debug.TraceNotImplemented("TextSprite.Damage()")
    End Method

    Method GainBonusHeart: Void()
        Debug.TraceNotImplemented("TextSprite.GainBonusHeart()")
    End Method

    Method GainCursedHearts: Void(hearts: Int)
        Debug.TraceNotImplemented("TextSprite.GainCursedHearts()")
    End Method

    Method GainHearts: Void(hearts: Int, full: Bool)
        Debug.TraceNotImplemented("TextSprite.GainHearts()")
    End Method

    Method Get: Int()
        Debug.TraceNotImplemented("TextSprite.Get3()")
    End Method

    Method GetHearts: Int()
        Debug.TraceNotImplemented("TextSprite.GetHearts()")
    End Method

    Method GetHeartValue: Int(offset: Int)
        Debug.TraceNotImplemented("TextSprite.GetHeartValue()")
    End Method

    Method GetMax: Int()
        Debug.TraceNotImplemented("TextSprite.GetMax()")
    End Method

    Method GetNormal: Int()
        Debug.TraceNotImplemented("TextSprite.GetNormal()")
    End Method

    Method GetNormalMax: Int()
        Debug.TraceNotImplemented("TextSprite.GetNormalMax()")
    End Method

    Method Heal: Bool(amount: Int, allowGluttony: Bool)
        Debug.TraceNotImplemented("TextSprite.Heal2()")
    End Method

    Method IsCursedHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("TextSprite.IsCursedHeart()")
    End Method

    Method IsEmptyHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("TextSprite.IsEmptyHeart()")
    End Method

    Method IsFullHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("TextSprite.IsFullHeart()")
    End Method

    Method IsHalfHeart: Bool(offset: Int)
        Debug.TraceNotImplemented("TextSprite.IsHalfHeart()")
    End Method

    Method LoseBonusHeart: Void()
        Debug.TraceNotImplemented("TextSprite.LoseBonusHeart()")
    End Method

    Method ProcessCurse: Void()
        Debug.TraceNotImplemented("TextSprite.ProcessCurse()")
    End Method

    Method Refill: Void()
        Debug.TraceNotImplemented("TextSprite.Refill()")
    End Method

    Method RefillAsCursed: Void()
        Debug.TraceNotImplemented("TextSprite.RefillAsCursed()")
    End Method

    Method RefillTo: Void(amount: Int)
        Debug.TraceNotImplemented("TextSprite.RefillTo()")
    End Method

    Method Reset: Void(newMax: Int)
        Debug.TraceNotImplemented("TextSprite.Reset2()")
    End Method

    Method ResetFragile: Void()
        Debug.TraceNotImplemented("TextSprite.ResetFragile()")
    End Method

    Method Revive: Void()
        Debug.TraceNotImplemented("TextSprite.Revive()")
    End Method

    Method NoTrim: Void()
        ApplyMax()
        CurseAllHearts()
        Damage(0)
        GainBonusHeart()
        GainCursedHearts(0)
        GainHearts(0, False)
        Get()
        GetHearts()
        GetHeartValue(0)
        GetMax()
        GetNormal()
        GetNormalMax()
        Heal(0, False)
        IsCursedHeart(0)
        IsEmptyHeart(0)
        IsFullHeart(0)
        IsHalfHeart(0)
        LoseBonusHeart()
        ProcessCurse()
        Refill()
        RefillAsCursed()
        RefillTo(0)
        Reset(0)
        ResetFragile()
        Revive()
    End Method

End Class
