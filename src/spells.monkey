'Strict

Import monkey.map
Import logger

Class Spells

    Global CHARM_RADIUS: Int
    Global EARTHQUAKE_RADIUS: Int
    Global FREEZE_RADIUS: Int
    Global SHIELD_BEATS: Int

    Global fireballDisplay: Object
    Global pulseAnim: Object
    Global pulseDisplay: Object
    Global pulseInWorld: Object
    Global spellCoolKills: StringMap<Int> = New StringMap<Int>()

    Function CastDescend: Void(player: Object)
        Debug.TraceNotImplemented("Spells.CastDescend(Object)")
    End Function

    Function CastEarth: Void(player: Object, useGreater: Bool)
        Debug.TraceNotImplemented("Spells.CastEarth(Object, Bool)")
    End Function

    Function CastFireball: Void(xVal: Int, yVal: Int, dirLeft: Bool, player: Object, displayX: Int, scroll: Bool, fireTrap: Bool)
        Debug.TraceNotImplemented("Spells.CastFireball(Int, Int, Bool, Object, Int, Bool, Bool)")
    End Function

    Function CastPulse: Void(ent: Object, useGreater: Bool)
        Debug.TraceNotImplemented("Spells.CastPulse(Object, Bool)")
    End Function

    Function CastSpell: Bool(sp: Int, forceGreater: Bool, player: Object, scroll: Bool)
        Debug.TraceNotImplemented("Spells.CastSpell(Int, Bool, Object, Bool)")
    End Function

    Function CastSpell1: Bool(player: Object)
        Debug.TraceNotImplemented("Spells.CastSpell1(Object)")
    End Function

    Function CastSpell2: Bool(player: Object)
        Debug.TraceNotImplemented("Spells.CastSpell2(Object)")
    End Function

    Function CastTransform: Void(player: Object)
        Debug.TraceNotImplemented("Spells.CastTransform(Object)")
    End Function

    Function CooldownAllSpells: Void()
        Debug.TraceNotImplemented("Spells.CooldownAllSpells()")
    End Function

    Function EarthPushAt: Void(player: Object, dx: Int, dy: Int)
        Debug.TraceNotImplemented("Spells.EarthPushAt(Object, Int, Int)")
    End Function

    Function ForceKnockback: Void(player: Object, e: Object, dir: Int)
        Debug.TraceNotImplemented("Spells.ForceKnockback(Object, Object, Int)")
    End Function

    Function GetBloodMagicDamage: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.GetBloodMagicDamage(Int)")
    End Function

    Function GetBloodMagicDamageString: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.GetBloodMagicDamageString(Int)")
    End Function

    Function GetKillsUntilCooldown: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.GetKillsUntilCooldown(Int)")
    End Function

    Function GetKillsUntilCooldownString: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.GetKillsUntilCooldownString(Int)")
    End Function

    Function GetSpellCooldownKills: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.GetSpellCooldownKills(Int)")
    End Function

    Function ImmediatelyCastSpell: Void(sp: Int, useGreater: Bool, player: Object, scroll: Bool, skipFlyawayAndVO: Bool)
        Debug.TraceNotImplemented("Spells.ImmediatelyCastSpell(Int, Bool, Object, Bool, Bool)")
    End Function

    Function Init: Void()
        Debug.TraceNotImplemented("Spells.Init()")
    End Function

    Function InitLearnedSpells: Void()
        Debug.TraceNotImplemented("Spells.InitLearnedSpells()")
    End Function

    Function IsSpellCooled: Bool(sp: Int)
        Debug.TraceNotImplemented("Spells.IsSpellCooled(Int)")
    End Function

    Function Kill: Void()
        Debug.TraceNotImplemented("Spells.Kill()")
    End Function

    Function LearnSpell: Int(sp: Int)
        Debug.TraceNotImplemented("Spells.LearnSpell(Int)")
    End Function

    Function PulseDir: Void(ent: Object, useGreater: Bool, dir: Int)
        Debug.TraceNotImplemented("Spells.PulseDir(Object, Bool, Int)")
    End Function

    Function Render: Void()
        Debug.TraceNotImplemented("Spells.Render()")
    End Function

    Function RenderPulse: Void()
        Debug.TraceNotImplemented("Spells.RenderPulse()")
    End Function

    Function _EditorFix: Void() End

End Class

Class PulseData

    Function _EditorFix: Void() End

    Field x: Int
    Field y: Int
    Field t: Int

End Class

Class FireballData

    Function _EditorFix: Void() End

    Field dirLeft: Bool
    Field x: Int
    Field y: Int
    Field duration: Int

End Class
