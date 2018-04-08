Strict

Import monkey.list
Import monkey.map
Import beatanimationdata
Import mobileentity
Import point

Class Enemy Extends MobileEntity Abstract

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
        Throw New Throwable()
    End Function

    Function ApplyMonkeyPawAll: Void()
        Throw New Throwable()
    End Function

    Function Charm: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Function

    Function CreateLord: Void()
        Throw New Throwable()
    End Function

    Function CullAllEnemies: Void()
        Throw New Throwable()
    End Function

    Function CullEnemiesDownTo: Void(cullNum: Int)
        Throw New Throwable()
    End Function

    Function DoesDamageKnockback: Bool(player: Object, damageSource: Int)
        Throw New Throwable()
    End Function

    Function EarthquakeEnemies: Void(xVal: Int, yVal: Int, damageAmount: Int)
        Throw New Throwable()
    End Function

    Function EnemiesHaveMovedClosestBeat: Bool()
        Throw New Throwable()
    End Function

    Function EnemiesHaveMovedThisBeat: Bool()
        Throw New Throwable()
    End Function

    Function FreezeEnemiesNear: Void(xVal: Int, yVal: Int, duration: Int, allEnemies: Bool)
        Throw New Throwable()
    End Function

    Function GetBaseType: Int(fullType: Int)
        Throw New Throwable()
    End Function

    Function GetDamagableEnemiesAt: Object(xVal: Int, yVal: Int, phasing: Bool, piercing: Bool, attackSourceX: Int, attackSourceY: Int, dVal: Int)
        Throw New Throwable()
    End Function

    Function GetEnemyAt: Object(xVal: Int, yVal: Int, includeFalling: Bool)
        Throw New Throwable()
    End Function

    Function GetEnemyName: Int(type: Int)
        Throw New Throwable()
    End Function

    Function GetEnemyNameHelper: Int(type: Int)
        Throw New Throwable()
    End Function

    Function GetEnemyXML: Object(name: Int, level: Int)
        Throw New Throwable()
    End Function

    Function GetNumArenaEnemiesRemaining: Int()
        Throw New Throwable()
    End Function

    Function GetNumCullableEnemies: Int()
        Throw New Throwable()
    End Function

    Function GetNumEnemiesIgnoreDancers: Int()
        Throw New Throwable()
    End Function

    Function GetNumPenaltyBoxMinibosses: Int()
        Throw New Throwable()
    End Function

    Function GetNumStairLockingMinibosses: Int()
        Throw New Throwable()
    End Function

    Function GetRandomEnemy: Object()
        Throw New Throwable()
    End Function

    Function KillAllEnemies: Void()
        Throw New Throwable()
    End Function

    Function KillAllNonConductorEnemies: Void()
        Throw New Throwable()
    End Function

    Function KillAllNonNecroDancerEnemies: Void()
        Throw New Throwable()
    End Function

    Function LoadBestiarySprite: Object(type: Int)
        Throw New Throwable()
    End Function

    Function MakeEnemy: Enemy(xVal: Int, yVal: Int, type: Int)
        Throw New Throwable()
    End Function

    Function MakeNonNecroDancerEnemiesIntoFormationDancers: Void()
        Throw New Throwable()
    End Function

    Function MarkAllEnemiesAsVisible: Void()
        Throw New Throwable()
    End Function

    Function MoveAll: Void()
        Throw New Throwable()
    End Function

    Function MoveSwarmEnemiesAwayFromStartLocation: Void()
        Throw New Throwable()
    End Function

    Function ResetAll: Void()
        Throw New Throwable()
    End Function

    Function SetAllEnemiesMinimumMoveDistance: Void(dist: Int)
        Throw New Throwable()
    End Function

    Function SetAllNonNecroDancerEnemyMoveDelays: Void(cmd: Int)
        Throw New Throwable()
    End Function

    Function SetEnemiesToDropNoCoins: Void()
        Throw New Throwable()
    End Function

    Function SetEnemiesToDropNoCoinsOverride: Void()
        Throw New Throwable()
    End Function

    Function StartRandomizerRun: Void()
        Throw New Throwable()
    End Function

    Function _EditorFix: Void() End

    Field type: Int
    Field field_110: Int
    Field isLord: Bool
    Field field_118: Int
    Field field_11C: Bool
    Field field_11D: Bool
    Field field_11E: Bool
    Field field_11F: Bool
    Field field_120: Bool
    Field field_121: Bool
    Field field_124: Int[]
    Field field_128: String[]
    Field field_12C: Int
    Field field_130: Int
    Field field_134: Int
    Field field_138: Bool
    Field field_139: Bool
    Field field_13C: String
    Field field_140: Bool
    Field field_144: Int
    Field field_148: Int
    Field field_14C: Int
    Field field_150: Int
    Field field_154: Bool
    Field field_158: String
    Field field_15C: IntMap<BeatAnimationData>
    Field field_160: IntMap<BeatAnimationData>
    Field field_164: IntMap<BeatAnimationData>
    Field field_168: IntMap<BeatAnimationData>
    Field field_16C: IntMap<BeatAnimationData>
    Field field_170: IntMap<BeatAnimationData>
    Field field_174: Int
    Field field_178: Int
    Field field_17C: Int
    Field field_180: Int
    Field field_184: Int
    Field field_188: Int
    Field field_18C: String
    Field field_190: String
    Field field_194: Bool
    Field field_198: String
    Field field_19C: Bool
    Field field_19D: Bool
    Field field_19E: Bool
    Field field_19F: Bool
    Field field_1A0: Int
    Field field_1A4: Int
    Field field_1A8: Int
    Field isMiniboss: Bool
    Field field_1AD: Bool
    Field field_1AE: Bool
    Field field_1AF: Bool
    Field field_1B0: Int
    Field field_1B4: Int
    Field field_1B8: Int
    Field field_1BC: Point
    Field field_1C0: Int
    Field field_1C4: Int
    Field field_1C8: String
    Field field_1CC: Bool
    Field field_1D0: Int
    Field field_1D4: Bool
    Field field_1D5: Bool
    Field field_1D6: Bool
    Field field_1D8: Int
    Field field_1DC: Int
    Field field_1E0: Int
    Field field_1E4: Bool
    Field field_1E5: Bool
    Field field_1E6: Bool
    Field field_1E7: Bool
    Field field_1E8: Bool
    Field field_1E9: Bool
    Field field_1EA: Bool
    Field field_1EB: Bool
    Field field_1EC: Bool
    Field field_1ED: Bool
    Field field_1F0: Int
    Field field_1F4: Bool
    Field field_1F5: Bool
    Field field_1F6: Bool
    Field field_1F7: Bool
    Field field_1F8: Bool
    Field field_1F9: Bool
    Field field_1FC: Int
    Field field_200: Point
    Field field_204: Bool
    Field field_205: Bool
    Field field_206: Bool
    Field field_208: Int
    Field field_20C: Bool
    Field field_210: Int
    Field field_214: Int
    Field field_218: Int
    Field field_21C: Int
    Field field_220: Int
    Field field_224: Int
    Field field_228: Int
    Field field_22C: Bool
    Field field_22D: Bool
    Field field_22E: Bool

    Method AdjustLordImage: Void()
        Throw New Throwable()
    End Method

    Method AdvanceMovementDelay: Void()
        Throw New Throwable()
    End Method

    Method AnimateToTheBeat: Void()
        Throw New Throwable()
    End Method

    Method ApplyMonkeyPaw: Void()
        Throw New Throwable()
    End Method

    Method AttemptMove: Int(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method BasicFlee: Object(includeDiagonals: Bool)
        Throw New Throwable()
    End Method

    Method BasicSeek: Object()
        Throw New Throwable()
    End Method

    Method BasicSeekAvoidLiquids: Object()
        Throw New Throwable()
    End Method

    Method BasicSeekIncludeDiagonals: Object()
        Throw New Throwable()
    End Method

    Method BasicSeekInWalls: Object()
        Throw New Throwable()
    End Method

    Method BasicSeekNoTraps: Object()
        Throw New Throwable()
    End Method

    Method BasicSeekTarget: Object(targetX: Int, targetY: Int, targetLastX: Int, targetLastY: Int, ignoreLiquids: Bool, ignoreTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Throw New Throwable()
    End Method

    Method BasicSeekTargetIncludeDiagonals: Object(targetX: Int, targetY: Int)
        Throw New Throwable()
    End Method

    Method BasicSeekTargetIncludeDiagonals_dumb: Object(targetX: Int, targetY: Int)
        Throw New Throwable()
    End Method

    Method CanBeLord: Bool()
        Throw New Throwable()
    End Method

    Method CheckFamiliarTouch: Void(dir: Int)
        Throw New Throwable()
    End Method

    Method Cull: Void()
        Throw New Throwable()
    End Method

    Method CustomMoveCheck: Bool(newX: Int, newY: Int)
        Throw New Throwable()
    End Method

    Method Delete: Void()
        Throw New Throwable()
    End Method

    Method DiagonalsOnlySeekTarget: Object(targetX: Int, targetY: Int, bounceOnFail: Bool)
        Throw New Throwable()
    End Method

    Method Die: Void()
        Throw New Throwable()
    End Method

    Method ExemptFromMysteryMode: Bool()
        Throw New Throwable()
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Throw New Throwable()
    End Method

    Method GetAdjacentTileThatIsClosestToTarget: Object(targetX: Int, targetY: Int, moveDistVal: Int)
        Throw New Throwable()
    End Method

    Method GetBeatNum: Int()
        Throw New Throwable()
    End Method

    Method GetClosestMovement: Object(targetX: Int, targetY: Int, dirVal: Int, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Throw New Throwable()
    End Method

    Method GetDisplayHealth: Int()
        Throw New Throwable()
    End Method

    Method GetDisplayHealthMax: Int()
        Throw New Throwable()
    End Method

    Method GetFurthestMovement: Object(targetX: Int, targetY: Int, allowCollisions: Bool, includeDiagonal: Bool)
        Throw New Throwable()
    End Method

    Method GetMovementDirection: Object()
        Throw New Throwable()
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Throw New Throwable()
    End Method

    Method ImageFlipX: Void(flipX: Bool)
        Throw New Throwable()
    End Method

    Method Init: Void(xVal: Int, yVal: Int, l: Int, name: String, overrideSpriteName: String, overrideFrameW: Int, overrideFrameH: Int)
        Throw New Throwable()
    End Method

    Method InitDirtJump: Void(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method InitImage: Void(enemyXML: Object, overrideSpriteName: Int, overrideFrameW: Int, overrideFrameH: Int)
        Throw New Throwable()
    End Method

    Method IsAt: Bool(xVal: Int, yVal: Int)
        Throw New Throwable()
    End Method

    Method IsBetweenFraction: Bool(on: Float, off: Float)
        Throw New Throwable()
    End Method

    Method IsCullable: Bool()
        Throw New Throwable()
    End Method

    Method IsDoubleHit: Bool(damageSource: Int, hitter: Object)
        Throw New Throwable()
    End Method

    Method IsStealthed: Bool()
        Throw New Throwable()
    End Method

    Method Knockback: Void(dir: Int)
        Throw New Throwable()
    End Method

    Method MakeLord: Void()
        Throw New Throwable()
    End Method

    Method Move: Int()
        Throw New Throwable()
    End Method

    Method MoveFail: Void()
        Throw New Throwable()
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Throw New Throwable()
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Throw New Throwable()
    End Method

    Method RandomIncludeDiagonals: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
        Throw New Throwable()
    End Method

    Method RandomSeek: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
        Throw New Throwable()
    End Method

    Method RelativeVideoTimeUntilBeat: Float()
        Throw New Throwable()
    End Method

    Method Render: Void()
        Throw New Throwable()
    End Method

    Method SelectOptimalMoveFrom: Object(targetX: Int, targetY: Int, moves: Object, farthest: Bool, allowCollisions: Bool, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Throw New Throwable()
    End Method

    Method SetDoubleHitData: Void(damageSource: Int, hitter: Object)
        Throw New Throwable()
    End Method

    Method Update: Void()
        Throw New Throwable()
    End Method

    Method NoTrim: Void()
        Super.NoTrim()
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
        Init(0, 0, 0, 0, 0, 0, 0)
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
