Import monkey.list
Import monkey.map
Import mobileentity
Import point

Class Enemy Extends MobileEntity

    Global enemiesFearfulDuration: Int
    Global enemiesPaused: Bool
    Global enemyList: List<Enemy>
    Global heartEmptySmall: Object
    Global heartSmall: Object
    Global killingAllEnemies: Object
    Global lastWraithSpawnBeat: Object
    Global movesBehind: Object
    Global randomizerXML: Object

    Function AddTagsToEnemyName: Int(eName: Int, size: Int)
    End Function

    Function ApplyMonkeyPawAll: Void()
    End Function

    Function Charm: Void(xVal: Int, yVal: Int)
    End Function

    Function CreateLord: Void()
    End Function

    Function CullAllEnemies: Void()
    End Function

    Function CullEnemiesDownTo: Void(cullNum: Int)
    End Function

    Function DoesDamageKnockback: Bool(player: Object, damageSource: Int)
    End Function

    Function EarthquakeEnemies: Void(xVal: Int, yVal: Int, damageAmount: Int)
    End Function

    Function EnemiesHaveMovedClosestBeat: Bool()
    End Function

    Function EnemiesHaveMovedThisBeat: Bool()
    End Function

    Function FreezeEnemiesNear: Void(xVal: Int, yVal: Int, duration: Int, allEnemies: Bool)
    End Function

    Function GetBaseType: Int(fullType: Int)
    End Function

    Function GetDamagableEnemiesAt: Object(xVal: Int, yVal: Int, phasing: Bool, piercing: Bool, attackSourceX: Int, attackSourceY: Int, dVal: Int)
    End Function

    Function GetEnemyAt: Object(xVal: Int, yVal: Int, includeFalling: Bool)
    End Function

    Function GetEnemyName: Int(type: Int)
    End Function

    Function GetEnemyNameHelper: Int(type: Int)
    End Function

    Function GetEnemyXML: Object(name: Int, level: Int)
    End Function

    Function GetNumArenaEnemiesRemaining: Int()
    End Function

    Function GetNumCullableEnemies: Int()
    End Function

    Function GetNumEnemiesIgnoreDancers: Int()
    End Function

    Function GetNumPenaltyBoxMinibosses: Int()
    End Function

    Function GetNumStairLockingMinibosses: Int()
    End Function

    Function GetRandomEnemy: Object()
    End Function

    Function KillAllEnemies: Void()
    End Function

    Function KillAllNonConductorEnemies: Void()
    End Function

    Function KillAllNonNecroDancerEnemies: Void()
    End Function

    Function LoadBestiarySprite: Object(type: Int)
    End Function

    Function MakeEnemy: Enemy(xVal: Int, yVal: Int, type: Int)
    End Function

    Function MakeNonNecroDancerEnemiesIntoFormationDancers: Void()
    End Function

    Function MarkAllEnemiesAsVisible: Void()
    End Function

    Function MoveAll: Void()
    End Function

    Function MoveSwarmEnemiesAwayFromStartLocation: Void()
    End Function

    Function ResetAll: Void()
    End Function

    Function SetAllEnemiesMinimumMoveDistance: Void(dist: Int)
    End Function

    Function SetAllNonNecroDancerEnemyMoveDelays: Void(cmd: Int)
    End Function

    Function SetEnemiesToDropNoCoins: Void()
    End Function

    Function SetEnemiesToDropNoCoinsOverride: Void()
    End Function

    Function StartRandomizerRun: Void()
    End Function

    Function _EditorFix() End

    Field field_F4: Bool
    Field field_F8: Int
    Field field_FC: Int
    Field field_100: Int
    Field field_104: Bool
    Field field_105: Bool
    Field field_106: Bool
    Field field_107: Bool
    Field field_108: Bool
    Field field_109: Bool
    Field field_10C: Int
    Field type: Int
    Field field_114: Int
    Field isLord: Bool
    Field field_11C: Int
    Field field_120: Bool
    Field field_121: Bool
    Field field_122: Bool
    Field field_123: Bool
    Field field_124: Bool
    Field field_125: Bool
    Field field_128: String
    Field field_12C: Int
    Field field_130: Int
    Field field_134: Int
    Field field_138: Int
    Field field_13C: Bool
    Field field_13D: Bool
    Field field_140: String
    Field field_144: Bool
    Field field_148: Int
    Field field_14C: Int
    Field field_150: Int
    Field field_154: Int
    Field field_158: Bool
    Field field_15C: String
    Field field_160: IntMap<Object>
    Field field_164: IntMap<Object>
    Field field_168: IntMap<Object>
    Field field_16C: IntMap<Object>
    Field field_170: IntMap<Object>
    Field field_174: IntMap<Object>
    Field field_178: Int
    Field field_17C: Int
    Field field_180: Int
    Field field_184: Int
    Field field_188: Int
    Field field_18C: Int
    Field field_190: String
    Field field_194: String
    Field field_198: Int
    Field field_19C: String
    Field field_1A0: Bool
    Field field_1A1: Bool
    Field field_1A2: Bool
    Field field_1A3: Bool
    Field field_1A4: Int
    Field field_1A8: Int
    Field field_1AC: Int
    Field isMiniboss: Bool
    Field field_1B1: Bool
    Field field_1B2: Bool
    Field field_1B3: Bool
    Field field_1B4: Int
    Field field_1B8: Int
    Field field_1BC: Int
    Field field_1C0: Point
    Field field_1C4: Int
    Field field_1C8: Int
    Field field_1CC: String
    Field field_1D0: Bool
    Field field_1D4: Int
    Field field_1D8: Bool
    Field field_1D9: Bool
    Field field_1DA: Bool
    Field field_1DC: Int
    Field field_1E0: Int
    Field field_1E4: Int
    Field field_1E8: Bool
    Field field_1E9: Bool
    Field field_1EA: Bool
    Field field_1EB: Bool
    Field field_1EC: Bool
    Field field_1ED: Bool
    Field field_1EE: Bool
    Field field_1EF: Bool
    Field field_1F0: Bool
    Field field_1F1: Bool
    Field field_1F4: Int
    Field field_1F8: Bool
    Field field_1F9: Bool
    Field field_1FA: Bool
    Field field_1FB: Bool
    Field field_1FC: Bool
    Field field_1FD: Bool
    Field field_200: Int
    Field field_204: Point
    Field field_208: Bool
    Field field_209: Bool
    Field field_20A: Bool
    Field field_20C: Int
    Field field_210: Bool
    Field field_214: Int
    Field field_218: Int
    Field field_21C: Int
    Field field_220: Int
    Field field_224: Int
    Field field_228: Int
    Field field_22C: Int
    Field field_230: Bool
    Field field_231: Bool
    Field field_232: Bool

    Method AdjustLordImage: Void()
    End Method

    Method AdvanceMovementDelay: Void()
    End Method

    Method AnimateToTheBeat: Void()
    End Method

    Method ApplyMonkeyPaw: Void()
    End Method

    Method AttemptMove: Int(xVal: Int, yVal: Int)
    End Method

    Method BasicFlee: Object(includeDiagonals: Bool)
    End Method

    Method BasicSeek: Object()
    End Method

    Method BasicSeekAvoidLiquids: Object()
    End Method

    Method BasicSeekIncludeDiagonals: Object()
    End Method

    Method BasicSeekInWalls: Object()
    End Method

    Method BasicSeekNoTraps: Object()
    End Method

    Method BasicSeekTarget: Object(targetX: Int, targetY: Int, targetLastX: Int, targetLastY: Int, ignoreLiquids: Bool, ignoreTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
    End Method

    Method BasicSeekTargetIncludeDiagonals: Object(targetX: Int, targetY: Int)
    End Method

    Method BasicSeekTargetIncludeDiagonals_dumb: Object(targetX: Int, targetY: Int)
    End Method

    Method CanBeLord: Bool()
    End Method

    Method CheckFamiliarTouch: Void(dir: Int)
    End Method

    Method Cull: Void()
    End Method

    Method CustomMoveCheck: Bool(newX: Int, newY: Int)
    End Method

    Method Delete: Void()
    End Method

    Method DiagonalsOnlySeekTarget: Object(targetX: Int, targetY: Int, bounceOnFail: Bool)
    End Method

    Method Die: Void()
    End Method

    Method ExemptFromMysteryMode: Bool()
    End Method

    Method Fall: Void(keepMultiplier: Bool)
    End Method

    Method GetAdjacentTileThatIsClosestToTarget: Object(targetX: Int, targetY: Int, moveDistVal: Int)
    End Method

    Method GetBeatNum: Int()
    End Method

    Method GetClosestMovement: Object(targetX: Int, targetY: Int, dirVal: Int, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
    End Method

    Method GetDisplayHealth: Int()
    End Method

    Method GetDisplayHealthMax: Int()
    End Method

    Method GetFurthestMovement: Object(targetX: Int, targetY: Int, allowCollisions: Bool, includeDiagonal: Bool)
    End Method

    Method GetMovementDirection: Object()
    End Method

    Method Hit: Bool(damageSource: Int, damage: Int, dir: Int, hitter: Object, hitAtLastTile: Bool, hitType: Int)
    End Method

    Method ImageFlipX: Void(flipX: Bool)
    End Method

    Method Init3: Void(xVal: Int, yVal: Int, l: Int, name: Int, overrideSpriteName: Int, overrideFrameW: Int, overrideFrameH: Int)
    End Method

    Method InitDirtJump: Void(xVal: Int, yVal: Int)
    End Method

    Method InitImage: Void(enemyXML: Object, overrideSpriteName: Int, overrideFrameW: Int, overrideFrameH: Int)
    End Method

    Method IsAt: Bool(xVal: Int, yVal: Int)
    End Method

    Method IsBetweenFraction: Bool(on: Float, off: Float)
    End Method

    Method IsCullable: Bool()
    End Method

    Method IsDoubleHit: Bool(damageSource: Int, hitter: Object)
    End Method

    Method IsStealthed: Bool()
    End Method

    Method Knockback: Void(dir: Int)
    End Method

    Method MakeLord: Void()
    End Method

    Method Move: Int()
    End Method

    Method MoveFail: Void()
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
    End Method

    Method RandomIncludeDiagonals: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
    End Method

    Method RandomSeek: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
    End Method

    Method RelativeVideoTimeUntilBeat: Float()
    End Method

    Method Render: Void()
    End Method

    Method SelectOptimalMoveFrom: Object(targetX: Int, targetY: Int, moves: Object, farthest: Bool, allowCollisions: Bool, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
    End Method

    Method SetDoubleHitData: Void(damageSource: Int, hitter: Object)
    End Method

    Method Update: Void()
    End Method

    Method NoTrim: Void()
        AddTagsToEnemyName(0, 0)
        ApplyMonkeyPawAll()
        Charm(0, 0)
        CreateLord()
        CullAllEnemies()
        CullEnemiesDownTo(0)
        DoesDamageKnockback(Null, 0)
        EarthquakeEnemies(0, 0, 0)
        EnemiesHaveMovedClosestBeat()
        EnemiesHaveMovedThisBeat()
        FreezeEnemiesNear(0, 0, 0, False)
        GetBaseType(0)
        GetDamagableEnemiesAt(0, 0, False, False, 0, 0, 0)
        GetEnemyAt(0, 0, False)
        GetEnemyName(0)
        GetEnemyNameHelper(0)
        GetEnemyXML(0, 0)
        GetNumArenaEnemiesRemaining()
        GetNumCullableEnemies()
        GetNumEnemiesIgnoreDancers()
        GetNumPenaltyBoxMinibosses()
        GetNumStairLockingMinibosses()
        GetRandomEnemy()
        KillAllEnemies()
        KillAllNonConductorEnemies()
        KillAllNonNecroDancerEnemies()
        LoadBestiarySprite(0)
        MakeEnemy(0, 0, 0)
        MakeNonNecroDancerEnemiesIntoFormationDancers()
        MarkAllEnemiesAsVisible()
        MoveAll()
        MoveSwarmEnemiesAwayFromStartLocation()
        ResetAll()
        SetAllEnemiesMinimumMoveDistance(0)
        SetAllNonNecroDancerEnemyMoveDelays(0)
        SetEnemiesToDropNoCoins()
        SetEnemiesToDropNoCoinsOverride()
        StartRandomizerRun()
        AdjustLordImage()
        AdvanceMovementDelay()
        AnimateToTheBeat()
        ApplyMonkeyPaw()
        AttemptMove(0, 0)
        BasicFlee(False)
        BasicSeek()
        BasicSeekAvoidLiquids()
        BasicSeekIncludeDiagonals()
        BasicSeekInWalls()
        BasicSeekNoTraps()
        BasicSeekTarget(0, 0, 0, 0, False, False, False, False)
        BasicSeekTargetIncludeDiagonals(0, 0)
        BasicSeekTargetIncludeDiagonals_dumb(0, 0)
        CanBeLord()
        CheckFamiliarTouch(0)
        Cull()
        CustomMoveCheck(0, 0)
        Delete()
        DiagonalsOnlySeekTarget(0, 0, False)
        Die()
        ExemptFromMysteryMode()
        Fall(False)
        GetAdjacentTileThatIsClosestToTarget(0, 0, 0)
        GetBeatNum()
        GetClosestMovement(0, 0, 0, False, False, False, False)
        GetDisplayHealth()
        GetDisplayHealthMax()
        GetFurthestMovement(0, 0, False, False)
        GetMovementDirection()
        Hit(0, 0, 0, Null, False, 0)
        ImageFlipX(False)
        Init3(0, 0, 0, 0, 0, 0, 0)
        InitDirtJump(0, 0)
        InitImage(Null, 0, 0, 0)
        IsAt(0, 0)
        IsBetweenFraction(0, 0)
        IsCullable()
        IsDoubleHit(0, Null)
        IsStealthed()
        Knockback(0)
        MakeLord()
        Move()
        MoveFail()
        MoveImmediate(0, 0, 0)
        MoveSucceed(False, False)
        RandomIncludeDiagonals(False, False)
        RandomSeek(False, False)
        RelativeVideoTimeUntilBeat()
        Render()
        SelectOptimalMoveFrom(0, 0, Null, False, False, False, False, False, False)
        SetDoubleHitData(0, Null)
        Update()
    End Method

End Class
