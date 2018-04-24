'Strict

Import monkey.list
Import monkey.map
Import beatanimationdata
Import entity
Import logger
Import mobileentity
Import player_class
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
        Debug.TraceNotImplemented("Enemy.AddTagsToEnemyName(Int, Int)")
    End Function

    Function ApplyMonkeyPawAll: Void()
        Debug.TraceNotImplemented("Enemy.ApplyMonkeyPawAll()")
    End Function

    Function Charm: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.Charm(Int, Int)")
    End Function

    Function CreateLord: Void()
        Debug.TraceNotImplemented("Enemy.CreateLord()")
    End Function

    Function CullAllEnemies: Void()
        Debug.TraceNotImplemented("Enemy.CullAllEnemies()")
    End Function

    Function CullEnemiesDownTo: Void(cullNum: Int)
        Debug.TraceNotImplemented("Enemy.CullEnemiesDownTo(Int)")
    End Function

    Function DoesDamageKnockback: Bool(player: Object, damageSource: Int)
        Debug.TraceNotImplemented("Enemy.DoesDamageKnockback(Object, Int)")
    End Function

    Function EarthquakeEnemies_SilentDamage: Void(xVal: Int, yVal: Int, damageAmount: Int)
        Debug.TraceNotImplemented("Enemy.EarthquakeEnemies_SilentDamage(Int, Int, Int)")
    End Function

    Function EnemiesHaveMovedClosestBeat: Bool()
        Debug.TraceNotImplemented("Enemy.EnemiesHaveMovedClosestBeat()")
    End Function

    Function EnemiesHaveMovedThisBeat: Bool()
        Debug.TraceNotImplemented("Enemy.EnemiesHaveMovedThisBeat()")
    End Function

    Function FreezeEnemiesNear: Void(xVal: Int, yVal: Int, duration: Int, allEnemies: Bool)
        Debug.TraceNotImplemented("Enemy.FreezeEnemiesNear(Int, Int, Int, Bool)")
    End Function

    Function GetBaseType: Int(fullType: Int)
        Debug.TraceNotImplemented("Enemy.GetBaseType(Int)")
    End Function

    Function GetDamagableEnemiesAt: Object(xVal: Int, yVal: Int, phasing: Bool, piercing: Bool, attackSourceX: Int, attackSourceY: Int, dVal: Int)
        Debug.TraceNotImplemented("Enemy.GetDamagableEnemiesAt(Int, Int, Bool, Bool, Int, Int, Int)")
    End Function

    Function GetEnemyAt: Object(xVal: Int, yVal: Int, includeFalling: Bool)
        Debug.TraceNotImplemented("Enemy.GetEnemyAt(Int, Int, Bool)")
    End Function

    Function GetEnemyName: Int(type: Int)
        Debug.TraceNotImplemented("Enemy.GetEnemyName(Int)")
    End Function

    Function GetEnemyNameHelper: Int(type: Int)
        Debug.TraceNotImplemented("Enemy.GetEnemyNameHelper(Int)")
    End Function

    Function GetEnemyXML: Object(name: Int, level: Int)
        Debug.TraceNotImplemented("Enemy.GetEnemyXML(Int, Int)")
    End Function

    Function GetNumArenaEnemiesRemaining: Int()
        Debug.TraceNotImplemented("Enemy.GetNumArenaEnemiesRemaining()")
    End Function

    Function GetNumCullableEnemies: Int()
        Debug.TraceNotImplemented("Enemy.GetNumCullableEnemies()")
    End Function

    Function GetNumEnemiesIgnoreDancers: Int()
        Debug.TraceNotImplemented("Enemy.GetNumEnemiesIgnoreDancers()")
    End Function

    Function GetNumPenaltyBoxMinibosses: Int()
        Debug.TraceNotImplemented("Enemy.GetNumPenaltyBoxMinibosses()")
    End Function

    Function GetNumStairLockingMinibosses: Int()
        Debug.TraceNotImplemented("Enemy.GetNumStairLockingMinibosses()")
    End Function

    Function GetRandomEnemy: Object()
        Debug.TraceNotImplemented("Enemy.GetRandomEnemy()")
    End Function

    Function KillAllEnemies: Void()
        Debug.TraceNotImplemented("Enemy.KillAllEnemies()")
    End Function

    Function KillAllNonConductorEnemies: Void()
        Debug.TraceNotImplemented("Enemy.KillAllNonConductorEnemies()")
    End Function

    Function KillAllNonNecroDancerEnemies: Void()
        Debug.TraceNotImplemented("Enemy.KillAllNonNecroDancerEnemies()")
    End Function

    Function LoadBestiarySprite: Object(type: Int)
        Debug.TraceNotImplemented("Enemy.LoadBestiarySprite(Int)")
    End Function

    Function MakeEnemy: Enemy(xVal: Int, yVal: Int, type: Int)
        Debug.TraceNotImplemented("Enemy.MakeEnemy(Int, Int, Int)")
    End Function

    Function MakeNonNecroDancerEnemiesIntoFormationDancers: Void()
        Debug.TraceNotImplemented("Enemy.MakeNonNecroDancerEnemiesIntoFormationDancers()")
    End Function

    Function MarkAllEnemiesAsVisible: Void()
        Debug.TraceNotImplemented("Enemy.MarkAllEnemiesAsVisible()")
    End Function

    Function MoveAll: Void()
        Debug.TraceNotImplemented("Enemy.MoveAll()")
    End Function

    Function MoveSwarmEnemiesAwayFromStartLocation: Void()
        Debug.TraceNotImplemented("Enemy.MoveSwarmEnemiesAwayFromStartLocation()")
    End Function

    Function ResetAll: Void()
        Debug.TraceNotImplemented("Enemy.ResetAll()")
    End Function

    Function SetAllEnemiesMinimumMoveDistance: Void(dist: Int)
        Debug.TraceNotImplemented("Enemy.SetAllEnemiesMinimumMoveDistance(Int)")
    End Function

    Function SetAllNonNecroDancerEnemyMoveDelays: Void(cmd: Int)
        Debug.TraceNotImplemented("Enemy.SetAllNonNecroDancerEnemyMoveDelays(Int)")
    End Function

    Function SetEnemiesToDropNoCoins: Void()
        Debug.TraceNotImplemented("Enemy.SetEnemiesToDropNoCoins()")
    End Function

    Function SetEnemiesToDropNoCoinsOverride: Void()
        Debug.TraceNotImplemented("Enemy.SetEnemiesToDropNoCoinsOverride()")
    End Function

    Function StartRandomizerRun: Void()
        Debug.TraceNotImplemented("Enemy.StartRandomizerRun()")
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
        Debug.TraceNotImplemented("Enemy.AdjustLordImage()")
    End Method

    Method AdvanceMovementDelay: Void()
        Debug.TraceNotImplemented("Enemy.AdvanceMovementDelay()")
    End Method

    Method AnimateToTheBeat: Void()
        Debug.TraceNotImplemented("Enemy.AnimateToTheBeat()")
    End Method

    Method ApplyMonkeyPaw: Void()
        Debug.TraceNotImplemented("Enemy.ApplyMonkeyPaw()")
    End Method

    Method AttemptMove: Int(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.AttemptMove(Int, Int)")
    End Method

    Method BasicFlee: Object(includeDiagonals: Bool)
        Debug.TraceNotImplemented("Enemy.BasicFlee(Bool)")
    End Method

    Method BasicSeek: Object()
        Debug.TraceNotImplemented("Enemy.BasicSeek()")
    End Method

    Method BasicSeekAvoidLiquids: Object()
        Debug.TraceNotImplemented("Enemy.BasicSeekAvoidLiquids()")
    End Method

    Method BasicSeekIncludeDiagonals: Object()
        Debug.TraceNotImplemented("Enemy.BasicSeekIncludeDiagonals()")
    End Method

    Method BasicSeekInWalls: Object()
        Debug.TraceNotImplemented("Enemy.BasicSeekInWalls()")
    End Method

    Method BasicSeekNoTraps: Object()
        Debug.TraceNotImplemented("Enemy.BasicSeekNoTraps()")
    End Method

    Method BasicSeekTarget: Object(targetX: Int, targetY: Int, targetLastX: Int, targetLastY: Int, ignoreLiquids: Bool, ignoreTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Debug.TraceNotImplemented("Enemy.BasicSeekTarget(Int, Int, Int, Int, Bool, Bool, Bool, Bool)")
    End Method

    Method BasicSeekTargetIncludeDiagonals: Object(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Enemy.BasicSeekTargetIncludeDiagonals(Int, Int)")
    End Method

    Method BasicSeekTargetIncludeDiagonals_dumb: Object(targetX: Int, targetY: Int)
        Debug.TraceNotImplemented("Enemy.BasicSeekTargetIncludeDiagonals_dumb(Int, Int)")
    End Method

    Method CanBeLord: Bool()
        Debug.TraceNotImplemented("Enemy.CanBeLord()")
    End Method

    Method CheckFamiliarTouch: Void(dir: Int)
        Debug.TraceNotImplemented("Enemy.CheckFamiliarTouch(Int)")
    End Method

    Method Cull: Void()
        Debug.TraceNotImplemented("Enemy.Cull()")
    End Method

    Method CustomMoveCheck: Bool(newX: Int, newY: Int)
        Debug.TraceNotImplemented("Enemy.CustomMoveCheck(Int, Int)")
    End Method

    Method Delete: Void()
        Debug.TraceNotImplemented("Enemy.Delete()")
    End Method

    Method DiagonalsOnlySeekTarget: Object(targetX: Int, targetY: Int, bounceOnFail: Bool)
        Debug.TraceNotImplemented("Enemy.DiagonalsOnlySeekTarget(Int, Int, Bool)")
    End Method

    Method Die: Void()
        Debug.TraceNotImplemented("Enemy.Die()")
    End Method

    Method ExemptFromMysteryMode: Bool()
        Debug.TraceNotImplemented("Enemy.ExemptFromMysteryMode()")
    End Method

    Method Fall: Void(keepMultiplier: Bool)
        Debug.TraceNotImplemented("Enemy.Fall(Bool)")
    End Method

    Method GetAdjacentTileThatIsClosestToTarget: Object(targetX: Int, targetY: Int, moveDistVal: Int)
        Debug.TraceNotImplemented("Enemy.GetAdjacentTileThatIsClosestToTarget(Int, Int, Int)")
    End Method

    Method GetBeatNum: Int()
        Debug.TraceNotImplemented("Enemy.GetBeatNum()")
    End Method

    Method GetClosestMovement: Object(targetX: Int, targetY: Int, dirVal: Int, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Debug.TraceNotImplemented("Enemy.GetClosestMovement(Int, Int, Int, Bool, Bool, Bool, Bool)")
    End Method

    Method GetDisplayHealth: Int()
        Debug.TraceNotImplemented("Enemy.GetDisplayHealth()")
    End Method

    Method GetDisplayHealthMax: Int()
        Debug.TraceNotImplemented("Enemy.GetDisplayHealthMax()")
    End Method

    Method GetFurthestMovement: Object(targetX: Int, targetY: Int, allowCollisions: Bool, includeDiagonal: Bool)
        Debug.TraceNotImplemented("Enemy.GetFurthestMovement(Int, Int, Bool, Bool)")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Enemy.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("Enemy.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImageFlipX: Void(flipX: Bool)
        Debug.TraceNotImplemented("Enemy.ImageFlipX(Bool)")
    End Method

    Method Init: Void(xVal: Int, yVal: Int, l: Int, name: String, overrideSpriteName: String, overrideFrameW: Int, overrideFrameH: Int)
        Debug.TraceNotImplemented("Enemy.Init(Int, Int, Int, String, String, Int, Int)")
    End Method

    Method InitDirtJump: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.InitDirtJump(Int, Int)")
    End Method

    Method InitImage: Void(enemyXML: Object, overrideSpriteName: Int, overrideFrameW: Int, overrideFrameH: Int)
        Debug.TraceNotImplemented("Enemy.InitImage(Object, Int, Int, Int)")
    End Method

    Method IsAt: Bool(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.IsAt(Int, Int)")
    End Method

    Method IsBetweenFraction: Bool(on: Float, off: Float)
        Debug.TraceNotImplemented("Enemy.IsBetweenFraction(Float, Float)")
    End Method

    Method IsCullable: Bool()
        Debug.TraceNotImplemented("Enemy.IsCullable()")
    End Method

    Method IsDoubleHit: Bool(damageSource: Int, hitter: Object)
        Debug.TraceNotImplemented("Enemy.IsDoubleHit(Int, Object)")
    End Method

    Method IsStealthed: Bool()
        Debug.TraceNotImplemented("Enemy.IsStealthed()")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("Enemy.Knockback(Int)")
    End Method

    Method MakeLord: Void()
        Debug.TraceNotImplemented("Enemy.MakeLord()")
    End Method

    Method Move: Int()
        Debug.TraceNotImplemented("Enemy.Move()")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Enemy.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("Enemy.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("Enemy.MoveSucceed(Bool, Bool)")
    End Method

    Method RandomIncludeDiagonals: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
        Debug.TraceNotImplemented("Enemy.RandomIncludeDiagonals(Bool, Bool)")
    End Method

    Method RandomSeek: Object(trueRandom: Bool, ignoreRingOfLuck: Bool)
        Debug.TraceNotImplemented("Enemy.RandomSeek(Bool, Bool)")
    End Method

    Method RelativeVideoTimeUntilBeat: Float()
        Debug.TraceNotImplemented("Enemy.RelativeVideoTimeUntilBeat()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Enemy.Render()")
    End Method

    Method SelectOptimalMoveFrom: Object(targetX: Int, targetY: Int, moves: Object, farthest: Bool, allowCollisions: Bool, allowLiquids: Bool, allowTraps: Bool, liquidsOnly: Bool, wallsOnly: Bool)
        Debug.TraceNotImplemented("Enemy.SelectOptimalMoveFrom(Int, Int, Object, Bool, Bool, Bool, Bool, Bool, Bool)")
    End Method

    Method SetDoubleHitData: Void(damageSource: Int, hitter: Object)
        Debug.TraceNotImplemented("Enemy.SetDoubleHitData(Int, Object)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("Enemy.Update()")
    End Method

End Class

Class EnemyList Extends List<Enemy>

    Function _EditorFix: Void() End

    Method Compare4: Int(a: Object, b: Object)
        Debug.TraceNotImplemented("EnemyList.Compare4(Object, Object)")
    End Method

End Class
