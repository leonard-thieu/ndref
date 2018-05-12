'Strict

Import mojo.graphics
Import enemy
Import entity
Import item
Import logger
Import point
Import sprite

Class Necrodancer Extends Enemy

    Global necrodancer: Necrodancer
    Global wallsStep: Int

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "necrodancer")

        Self.isNecroDancer = True

        Necrodancer.necrodancer = Self

        Self.iceBlast = New Sprite("spells/ice_blast.png", 8, Image.MidHandle)
        Self.iceBlast.SetHandle(-2, 59)
        Self.iceBlast.SetZOff(1000.0)

        Self.shieldImage = New Sprite("entities/necroshield.png", 1, Image.DefaultFlags)
        Self.shieldImage.SetZOff(Self.storedZOff + 10)

        Necrodancer.wallsStep = 0

        Self.origXOff = Self.xOff

        Select Self.level
            Case 1
                Self.MakeDancer()
            Case 2
                Self.actionTime = 10
        End Select

        Self.overrideHitSound = "necrodancerHit"
        Self.overrideDeathSound = "necrodancerDeath"
        Self.overrideAttackSound = "necrodancerAttack"
    End Method

    Field bombStep: Int
    Field saidLutePhrase: Bool
    Field iceBlast: Sprite
    Field shieldImage: Sprite
    Field origXOff: Int = -1
    Field actionTime: Int = 12
    Field theLute: Item
    Field doingTransition: Bool
    Field lastAction: Int
    Field actionDelay: Int = -1
    Field phase: Int
    Field summonCount: Int
    Field didCry: Bool
    Field actionDelayTime: Int = 3
    Field spellNum: Int
    Field iceBlastDuration: Int
    Field lastSpell: Int = -1
    Field vibrateCounter: Int = 3
    Field vibrateOffset: Float = 1.0
    Field madeLava: Bool

    Method CastIce: Void()
        Debug.TraceNotImplemented("Necrodancer.CastIce()")
    End Method

    Method ChooseSpell: Void()
        Debug.TraceNotImplemented("Necrodancer.ChooseSpell()")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Necrodancer.Die()")
    End Method

    Method GetEnemyTypeFromBombStep: Int()
        Debug.TraceNotImplemented("Necrodancer.GetEnemyTypeFromBombStep()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Necrodancer.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Necrodancer.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method IceAt: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Necrodancer.IceAt(Int, Int)")
    End Method

    Method InitFinalForm: Void()
        Debug.TraceNotImplemented("Necrodancer.InitFinalForm()")
    End Method

    Method MakeLava: Void()
        Debug.TraceNotImplemented("Necrodancer.MakeLava()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Necrodancer.MoveFail()")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Necrodancer.MoveSucceed(Bool, Bool)")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Necrodancer.Render()")
    End Method

    Method SummonAndTeleport: Void(doTeleport: Bool)
        Debug.TraceNotImplemented("Necrodancer.SummonAndTeleport(Bool)")
    End Method

    Method SummonEnemy: Void(enemyType: Int)
        Debug.TraceNotImplemented("Necrodancer.SummonEnemy(Int)")
    End Method

    Method SummonMiniboss: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonMiniboss()")
    End Method

    Method SummonSarcophagi: Void()
        Debug.TraceNotImplemented("Necrodancer.SummonSarcophagi()")
    End Method

    Method TakeAction: Void()
        Debug.TraceNotImplemented("Necrodancer.TakeAction()")
    End Method

    Method Teleport: Void()
        Debug.TraceNotImplemented("Necrodancer.Teleport()")
    End Method

    Method TriggeredWalls: Void()
        Debug.TraceNotImplemented("Necrodancer.TriggeredWalls()")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Necrodancer.Update()")
    End Method

End Class
