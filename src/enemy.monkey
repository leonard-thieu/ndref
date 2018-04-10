Strict

Import monkey.list
Import monkey.map
Import beatanimationdata
Import mobileentity
Import point
Import sprite
Import xml

Class Enemy Extends MobileEntity Abstract

    Global enemiesFearfulDuration: Int
    Global enemiesPaused: Bool
    Global enemyList: List<Enemy> = New List<Enemy>()
    Global heartEmptySmall: Sprite
    Global heartSmall: Sprite
    Global killingAllEnemies: Bool
    Global lastWraithSpawnBeat: Int
    Global movesBehind: Int
    Global randomizerXML: XMLDoc

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

    Method New()
        Super.New()
        
        Enemy.enemyList.AddLast(Self)

        Self.collides = True
        Self.isEnemy = True
    End Method

    Field enemyType: Int
    Field currentMoveDelay: Int = 1
    Field isLord: Bool
    Field animOverride: Int = -1
    Field isShieldedFrankensteinway: Bool
    Field isMiniboss: Bool
    Field isBoss: Bool
    Field isSarcophagus: Bool
    Field inArena: Bool
    Field stealth: Bool
    Field lastPlayerHitFrame: Int[4]
    Field lastPlayerHitSource: String[4]
    Field heartXOff: Int
    Field heartYOff: Int
    Field storedZOff: Int
    Field autoFlip: Bool = True
    Field baseFlipX: Bool
    Field shadowVal: String
    Field bounceOnMovementFail: Bool = True
    Field beatsPerMove: Int = 1
    Field movePriority: Int
    Field health: Int = 1
    Field healthMax: Int
    Field isMonkeyLike: Bool
    Field hitParticle: String
    Field animNormal: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field animNormal2: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field animNormal3: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field animBlink: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field animTell: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field animTellBlink: IntMap<BeatAnimationData> = New IntMap<BeatAnimationData>()
    Field hitTween: Int = 5
    Field hitShadowTween: Int = 6
    Field movementType: Int
    Field attackSwipeImage: Sprite
    Field jumpDirt: Sprite
    Field jumpDirtTimer: Int = -1
    Field overrideDeathSound: String
    Field overrideHitSound: String
    Field isFormationDancer: Bool
    Field overrideCrySound: String
    Field justSpawned: Bool = True
    Field isDancer: Bool
    Field charmed: Bool
    Field freezeImmunity: Bool
    Field killCoinMultiplier: Int
    Field bonusCoinsToDrop: Int
    Field ringOfGoldCoinsToDrop: Int
    Field isStairLockingMiniboss: Bool
    Field inPenaltyBox: Bool
    Field dropLordScroll: Bool
    Field dropNoCoinsOverride: Bool
    Field deathTrigger: Int
    Field renderSwipeTime: Int
    Field attackSwipeDir: Int = -1
    Field attackSwipePoint: Point = New Point(0, 0)
    Field jumpDirtX: Int
    Field jumpDirtY: Int
    Field overrideMoveSound: String
    Field changedTilePositionThisFrame: Bool
    Field zapGeneration: Int = -1
    Field isNecroDancer: Bool
    Field earthquaked: Bool
    Field movesRegardlessOfDistance: Bool
    Field blink_MIN: Int = 50
    Field blink_MAX: Int = 120
    Field blink_DUR: Int = 20
    Field containsItem: Bool
    Field enableTell: Bool = True
    Field swarmCulprit: Bool
    Field overrideAttackSwipe: Bool
    Field allowDiagonalFlip: Bool
    Field tramples: Bool
    Field showHearts: Bool = True
    Field inSecretRoom: Bool
    Field dontMove: Bool
    Field enableDeathEffects: Bool = True
    Field minEnemyMoveDistance: Int = 3
    Field exemptFromPause: Bool
    Field wasSeekingX: Bool = True
    Field isMosh: Bool
    Field isUnaffectedByArenas: Bool
    Field movedThisFrame: Bool
    Field attemptedMoveThisFrame: Bool
    Field seekingPlayer: Player
    Field lastAttemptedMove: Point = New Point(0, 0)
    Field useLastPosForSwipe: Bool
    Field justHitPlayer: Bool
    Field executedCry: Bool
    Field animOverrideState: Int = -1
    Field wasFrozen: Bool
    Field blinkDelay: Int
    Field blinkDuration: Int
    Field animOffset: Int
    Field overrideNormal2Timing: Int = -1
    Field overrideTellTiming: Int = -1
    Field numSwipeFrames: Int = 5
    Field numSwipeFramesPerImage: Int = 2
    Field alwaysShowHearts: Bool
    Field spawnsDropGold: Bool = True
    Field wasVisibleLastFrame: Bool

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
