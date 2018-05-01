'Strict

Import monkey.list
Import monkey.map
Import mojo.graphics
Import brl.json
Import armadillo
Import armoredskeleton
Import bat
Import beatanimationdata
Import beetle
IMport bishop
Import blademaster
Import cauldron
Import clone
Import devil
Import electric_mage
Import entity
Import evileye
Import fakewall
Import fire_elemental
Import fortissimole
Import gargoyle
Import ghast
Import ghost
Import ghoul
Import goblin
Import goblin_bomber
Import golem
Import gorgon
Import harpy
Import hellhound
Import ice_elemental
Import knight
Import lich
Import logger
Import mobileentity
Import mole
Import monkey_enemy
Import mushroom
Import mushroom_light
Import necrodancer
Import necrodancergame
Import orc
Import pawn
Import pixie
Import player_class
Import point
Import queen
Import rook
Import shove_monster
Import skeleton
Import skeletonknight
Import skeletonmage
Import skull
Import sleeping_goblin
Import slime
Import spider
Import sprite
Import tarmonster
Import trapcauldron
Import trapchest
Import warlock
Import water_ball
Import wight
Import wraith
Import xml
Import yeti
Import zombie
Import zombie_electric

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
        Local enemyNodes := JsonArray(necrodancergame.xmlData.Get("enemies")).GetData()

        Local enemyName: String
        For Local enemyNodeValue := EachIn enemyNodes
            Local enemyNode := JsonObject(enemyNodeValue)
            If enemyNode <> Null And
               item.GetInt(enemyNode, "id", EnemyId.None) = fullType
                enemyName = item.GetString(enemyNode, "name", "")

                Exit
            End If
        End For
        Assert(enemyName <> "")

        Local baseEnemyNode := Enemy.GetEnemyXML(enemyName, 1)
        Assert(baseEnemyNode <> Null)

        Local baseType := item.GetInt(baseEnemyNode, "id", EnemyId.None)
        Assert(baseType <> EnemyId.None)

        Return baseType
    End Function

    Function GetDamagableEnemiesAt: Object(xVal: Int, yVal: Int, phasing: Bool, piercing: Bool, attackSourceX: Int, attackSourceY: Int, dVal: Int)
        Debug.TraceNotImplemented("Enemy.GetDamagableEnemiesAt(Int, Int, Bool, Bool, Int, Int, Int)")
    End Function

    Function GetEnemyAt: Enemy(xVal: Int, yVal: Int, includeFalling: Bool)
        For Local enemy := EachIn Enemy.enemyList
            If (enemy.x <= xVal And xVal < enemy.x + enemy.width) And
               (enemy.y <= yVal And yVal < enemy.y + enemy.height)
                If includeFalling Or
                   Not enemy.falling
                    Return enemy
                End If
            End If
        End For

        Return Null
    End Function

    Function GetEnemyName: Int(type: Int)
        Debug.TraceNotImplemented("Enemy.GetEnemyName(Int)")
    End Function

    Function GetEnemyNameHelper: Int(type: Int)
        Debug.TraceNotImplemented("Enemy.GetEnemyNameHelper(Int)")
    End Function

    Function GetEnemyXML: JsonObject(name: String, level: Int)
        If Level.isRandomizerMode And
           Enemy.randomizerXML <> Null
            ' TODO: Implement when Randomizer Mode
            Debug.TraceNotImplemented("Enemy.GetEnemyXML(String, Int) (Randomizer Mode)")
        Else
            Local enemyNodes := JsonArray(necrodancergame.xmlData.Get("enemies")).GetData()

            For Local enemyNodeValue := EachIn enemyNodes
                Local enemyNode := JsonObject(enemyNodeValue)
                If enemyNode <> Null And
                   item.GetString(enemyNode, "name", "") = name And
                   item.GetInt(enemyNode, "type", 0) = level
                    Return enemyNode
                End If
            End For
        End If

        Return Null
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
        Local numPenaltyBoxMinibosses := 0

        For Local enemy := EachIn Enemy.enemyList
            If enemy.inPenaltyBox And
               enemy.isMiniboss
                numPenaltyBoxMinibosses += 1
            End If
        End For

        Return numPenaltyBoxMinibosses
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
        Local enemy: Enemy

        ' NOTE: This function is split into multiple functions to work around an MSVC compiler limit (hard limit of 128 nesting levels).
        '       Monkey X transpiles `Select` statements into chained `else-if` clauses when targeting C++. This causes the deep nesting.
        enemy = Enemy.MakeEnemy1(xVal, yVal, type)
        If enemy <> Null Then Return enemy

        enemy = Enemy.MakeEnemy2(xVal, yVal, type)
        If enemy <> Null Then Return enemy

        Return New Slime(xVal, yVal, 1)
    End Function

    Function MakeEnemy1: Enemy(xVal: Int, yVal: Int, type: Int)
        Local enemy: Enemy

        Select type
            Case EnemyId.GreenSlime enemy = New Slime(xVal, yVal, 1)
            Case EnemyId.BlueSlime enemy = New Slime(xVal, yVal, 2)
            Case EnemyId.OrangeSlime enemy = New Slime(xVal, yVal, 3)
            Case EnemyId.WhiteSkeleton enemy = New Skeleton(xVal, yVal, 1)
            Case EnemyId.YellowSkeleton enemy = New Skeleton(xVal, yVal, 2)
            Case EnemyId.BlackSkeleton enemy = New Skeleton(xVal, yVal, 3)
            Case EnemyId.BlueBat enemy = New Bat(xVal, yVal, 1)
            Case EnemyId.RedBat enemy = New Bat(xVal, yVal, 2)
            Case EnemyId.GreenBat enemy = New Bat(xVal, yVal, 3)
            Case EnemyId.PurpleMonkey enemy = New Monkey(xVal, yVal, 1)
            Case EnemyId.WhiteMonkey enemy = New Monkey(xVal, yVal, 2)
            Case EnemyId.Ghost enemy = New Ghost(xVal, yVal, 1)
            Case EnemyId.Zombie enemy = New Zombie(xVal, yVal, 1)
            Case EnemyId.Wraith enemy = New Wraith(xVal, yVal, 1)
            Case EnemyId.ChestMimic enemy = New TrapChest(xVal, yVal, 1)
            Case EnemyId.LockedChestMimic enemy = New TrapChest(xVal, yVal, 2)
            Case EnemyId.WhiteChestMimic enemy = New TrapChest(xVal, yVal, 3)
            Case EnemyId.WhiteArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 1)
            Case EnemyId.YellowArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 2)
            Case EnemyId.BlackArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 3)
            Case EnemyId.WhiteSkeletonMage enemy = New SkeletonMage(xVal, yVal, 1)
            Case EnemyId.YellowSkeletonMage enemy = New SkeletonMage(xVal, yVal, 2)
            Case EnemyId.BlackSkeletonMage enemy = New SkeletonMage(xVal, yVal, 3)
            Case EnemyId.BlueMushroom enemy = New Mushroom(xVal, yVal, 1)
            Case EnemyId.PurpleMushroom enemy = New Mushroom(xVal, yVal, 2)
            Case EnemyId.LightGolem enemy = New Golem(xVal, yVal, 1)
            Case EnemyId.DarkGolem enemy = New Golem(xVal, yVal, 2)
            Case EnemyId.WhiteArmadillo enemy = New Armadillo(xVal, yVal, 1)
            Case EnemyId.YellowArmadillo enemy = New Armadillo(xVal, yVal, 2)
            Case EnemyId.Clone enemy = New Clone(xVal, yVal, 1)
            Case EnemyId.TarMonster enemy = New TarMonster(xVal, yVal, 1)
            Case EnemyId.Mole enemy = New Mole(xVal, yVal, 1)
            Case EnemyId.Wight enemy = New Wight(xVal, yVal, 1)
            Case EnemyId.WallMimic enemy = New FakeWall(xVal, yVal, 1)
            Case EnemyId.MushroomLight enemy = New MushroomLight(xVal, yVal, 1, True, False)
            Case EnemyId.ExplodingMushroom enemy = New MushroomLight(xVal, yVal, 1, False, True)
            Case EnemyId.FireSlime enemy = New Slime(xVal, yVal, 5)
            Case EnemyId.IceSlime enemy = New Slime(xVal, yVal, 4)
            Case EnemyId.WhiteSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 1)
            Case EnemyId.YellowSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 2)
            Case EnemyId.BlackSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 3)
            Case EnemyId.FireElemental enemy = New FireElemental(xVal, yVal, 1)
            Case EnemyId.IceElemental enemy = New IceElemental(xVal, yVal, 1)
            Case EnemyId.PurpleGoblin enemy = New Goblin(xVal, yVal, 1)
            Case EnemyId.GrayGoblin enemy = New Goblin(xVal, yVal, 2)
            Case EnemyId.FireBeetle enemy = New Beetle(xVal, yVal, 1)
            Case EnemyId.IceBeetle enemy = New Beetle(xVal, yVal, 2)
            Case EnemyId.Hellhound enemy = New Hellhound(xVal, yVal, 1)
            Case EnemyId.ShoveMonster enemy = New ShoveMonster(xVal, yVal, 1)
            Case EnemyId.GrayShoveMonster enemy = New ShoveMonster(xVal, yVal, 2)
            Case EnemyId.Yeti enemy = New Yeti(xVal, yVal, 1)
            Case EnemyId.Ghast enemy = New Ghast(xVal, yVal, 1)
            Case EnemyId.FireCauldronMimic enemy = New TrapCauldron(xVal, yVal, 1)
            Case EnemyId.IceCauldronMimic enemy = New TrapCauldron(xVal, yVal, 2)
            Case EnemyId.FireCauldron enemy = New Cauldron(xVal, yVal, 1)
            Case EnemyId.IceCauldron enemy = New Cauldron(xVal, yVal, 2)
            Case EnemyId.GoblinBomber enemy = New GoblinBomber(xVal, yVal, 1)
            Case EnemyId.GoblinSentry enemy = New SleepingGoblin(xVal, yVal, 1)
            Case EnemyId.BlackBat enemy = New Bat(xVal, yVal, 4)
            Case EnemyId.OrangeArmadillo enemy = New Armadillo(xVal, yVal, 3)
            Case EnemyId.ApprenticeBlademaster enemy = New Blademaster(xVal, yVal, 1)
            Case EnemyId.Blademaster enemy = New Blademaster(xVal, yVal, 2)
            Case EnemyId.Ghoul enemy = New Ghoul(xVal, yVal, 1)
            Case EnemyId.OozeGolem enemy = New Golem(xVal, yVal, 3)
            Case EnemyId.Harpy enemy = New Harpy(xVal, yVal, 1)
            Case EnemyId.Lich enemy = New Lich(xVal, yVal, 1)
            Case EnemyId.RedLich enemy = New Lich(xVal, yVal, 2)
            Case EnemyId.BlackLich enemy = New Lich(xVal, yVal, 3)
            Case EnemyId.GreenMonkey enemy = New Monkey(xVal, yVal, 3)
            Case EnemyId.MagicMonkey enemy = New Monkey(xVal, yVal, 4)
            Case EnemyId.Pixie enemy = New Pixie(xVal, yVal, 1)
            Case EnemyId.Sarcophagus enemy = New Sarcophagus(xVal, yVal, 1)
            Case EnemyId.YellowSarcophagus enemy = New Sarcophagus(xVal, yVal, 2)
            Case EnemyId.BlackSarcophagus enemy = New Sarcophagus(xVal, yVal, 3)
            Case EnemyId.Spider enemy = New Spider(xVal, yVal, 1)
            Case EnemyId.Warlock enemy = New Warlock(xVal, yVal, 1)
            Case EnemyId.NeonWarlock enemy = New Warlock(xVal, yVal, 2)
            Case EnemyId.Mummy enemy = New Mummy(xVal, yVal, 1)
            Case EnemyId.Gargoyle1 enemy = New Gargoyle(xVal, yVal, 1)
            Case EnemyId.Gargoyle2 enemy = New Gargoyle(xVal, yVal, 2)
            Case EnemyId.Gargoyle3 enemy = New Gargoyle(xVal, yVal, 3)
            Case EnemyId.Gargoyle4 enemy = New Gargoyle(xVal, yVal, 4)
        End Select

        Return enemy
    End Function

    Function MakeEnemy2: Enemy(xVal: Int, yVal: Int, type: Int)
        Local enemy: Enemy

        Select type
            Case EnemyId.Gargoyle5 enemy = New Gargoyle(xVal, yVal, 5)
            Case EnemyId.Gargoyle6 enemy = New Gargoyle(xVal, yVal, 6)
            Case EnemyId.YellowDireBat enemy = New BatMiniboss(xVal, yVal, 1)
            Case EnemyId.BrownDireBat enemy = New BatMiniboss(xVal, yVal, 2)
            Case EnemyId.GreenDragon enemy = New Dragon(xVal, yVal, 1)
            Case EnemyId.RedDragon enemy = New Dragon(xVal, yVal, 2)
            Case EnemyId.BlueDragon enemy = New Dragon(xVal, yVal, 3)
            Case EnemyId.BlueBanshee enemy = New Banshee(xVal, yVal, 1)
            Case EnemyId.GreenBanshee enemy = New Banshee(xVal, yVal, 2)
            Case EnemyId.LightMinotaur enemy = New Minotaur(xVal, yVal, 1)
            Case EnemyId.DarkMinotaur enemy = New Minotaur(xVal, yVal, 2)
            Case EnemyId.DarkNightmare enemy = New Nightmare(xVal, yVal, 1)
            Case EnemyId.BloodNightmare enemy = New Nightmare(xVal, yVal, 2)
            Case EnemyId.TheMommy enemy = New Mommy(xVal, yVal, 1)
            Case EnemyId.Ogre enemy = New Ogre(xVal, yVal, 1)
            Case EnemyId.GoldMetroGnome enemy = New MetroGnome(xVal, yVal, 1)
            Case EnemyId.GreenMetroGnome enemy = New MetroGnome(xVal, yVal, 2)
            Case EnemyId.EarthDragon enemy = New Dragon(xVal, yVal, 4)
            Case EnemyId.Shopkeeper1 enemy = New Shopkeeper(xVal, yVal, 1, False)
            Case EnemyId.Shopkeeper2 enemy = New Shopkeeper(xVal, yVal, 2, False)
            Case EnemyId.Shopkeeper3 enemy = New Shopkeeper(xVal, yVal, 3, False)
            Case EnemyId.Shopkeeper4 enemy = New Shopkeeper(xVal, yVal, 4, False)
            Case EnemyId.ShopkeeperGhost enemy = New ShopkeeperGhost(xVal, yVal, 1)
            Case EnemyId.MonstrousShopkeeper enemy = New Shopkeeper(xVal, yVal, 5, False)
            Case EnemyId.CrystalSkeleton enemy = New Skeleton(xVal, yVal, 4)
            Case EnemyId.WhiteSkull enemy = New Skull(xVal, yVal, 1)
            Case EnemyId.YellowSkull enemy = New Skull(xVal, yVal, 2)
            Case EnemyId.BlackSkull enemy = New Skull(xVal, yVal, 3)
            Case EnemyId.CrystalSkull enemy = New Skull(xVal, yVal, 4)
            Case EnemyId.Fortissimole enemy = New Fortissimole(xVal, yVal, 1)
            Case EnemyId.Pawn enemy = New Pawn(xVal, yVal, 1)
            Case EnemyId.RedPawn enemy = New Pawn(xVal, yVal, 2)
            Case EnemyId.Knight enemy = New Knight(xVal, yVal, 1)
            Case EnemyId.RedKnight enemy = New Knight(xVal, yVal, 2)
            Case EnemyId.Bishop enemy = New Bishop(xVal, yVal, 1)
            Case EnemyId.RedBishop enemy = New Bishop(xVal, yVal, 2)
            Case EnemyId.Rook enemy = New Rook(xVal, yVal, 1)
            Case EnemyId.RedRook enemy = New Rook(xVal, yVal, 2)
            Case EnemyId.Queen enemy = New Queen(xVal, yVal, 1)
            Case EnemyId.RedQueen enemy = New Queen(xVal, yVal, 2)
            Case EnemyId.WaterBall enemy = New WaterBall(xVal, yVal, 1)
            Case EnemyId.PurpleElectricMage enemy = New ElectricMage(xVal, yVal, 1)
            Case EnemyId.RedElectricMage enemy = New ElectricMage(xVal, yVal, 2)
            Case EnemyId.GoldElectricMage enemy = New ElectricMage(xVal, yVal, 3)
            Case EnemyId.GreenGorgon enemy = New Gorgon(xVal, yVal, 1)
            Case EnemyId.ElectricZombie enemy = New ZombieElectric(xVal, yVal, 1)
            Case EnemyId.CrystalArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 4)
            Case EnemyId.CrystalSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 4)
            Case EnemyId.GreenEvilEye enemy = New EvilEye(xVal, yVal, 1)
            Case EnemyId.GoldGorgon enemy = New Gorgon(xVal, yVal, 2)
            Case EnemyId.PinkEvilEye enemy = New EvilEye(xVal, yVal, 2)
            Case EnemyId.GreenOrc enemy = New Orc(xVal, yVal, 1)
            Case EnemyId.PinkOrc enemy = New Orc(xVal, yVal, 2)
            Case EnemyId.PurpleOrc enemy = New Orc(xVal, yVal, 3)
            Case EnemyId.RedDevil enemy = New Devil(xVal, yVal, 1)
            Case EnemyId.GreenDevil enemy = New Devil(xVal, yVal, 2)
            Case EnemyId.PurpleSlime enemy = New Slime(xVal, yVal, 6)
            Case EnemyId.CursedWraith enemy = New Wraith(xVal, yVal, 2)
            Case EnemyId.CrateMimic enemy = New TrapChest(xVal, yVal, 4)
            Case EnemyId.ShopWallMimic enemy = New FakeWall(xVal, yVal, 2)
            Case EnemyId.BlackSlime enemy = New Slime(xVal, yVal, 7)
            Case EnemyId.WhiteSlime enemy = New Slime(xVal, yVal, 8)
            Case EnemyId.BarrelMimic enemy = New TrapChest(xVal, yVal, 5)
            Case EnemyId.ShrineMimic enemy = New TrapChest(xVal, yVal, 6)
            Case EnemyId.TarBall enemy = New WaterBall(xVal, yVal, 2)
        End Select

        Return enemy
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
        If Self.isMonkeyLike
            If Player.DoesAnyPlayerHaveItemOfType("misc_monkey_paw")
                Self.frozenPermanently = True
            End If
        End If
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
        If Not Self.dead
            Enemy.enemyList.RemoveEach(Self)

            Super.Die()
        End If
    End Method

    Method DiagonalsOnlySeekTarget: Object(targetX: Int, targetY: Int, bounceOnFail: Bool)
        Debug.TraceNotImplemented("Enemy.DiagonalsOnlySeekTarget(Int, Int, Bool)")
    End Method

    Method Die: Void()
        If Self.isStairLockingMiniboss And
           Self.health <= 0
            If Enemy.GetNumStairLockingMinibosses() = 1
                Player.PlayVOPlayer1("Yeah")
            End If
        Else
            If Util.IsCharacterActive(Character.Dove)
                If Not Enemy.killingAllEnemies And
                   Self.health <= 0
                    If Audio.GetClosestBeatNum(True) > 5
                        Local dist := Util.GetDistFromClosestPlayer(Self.x, Self.y, False)
                        If dist <= 8.0
                            'Audio.PlayGameSound("doveOhNo")
                        End If
                    End If
                End If
            End If
        End If

        If Self.inPenaltyBox And
           Self.isMiniboss And
           Enemy.GetNumPenaltyBoxMinibosses() = 1
            Level.ClearMinibossWall()
        End If

        Local location := Self.GetLocation()

        If Self.isLord And
           Self.coinsToDrop > 0
            If Self.dropLordScroll
                New Item(location.x, location.y, "scroll_gigantism", False, -1, False)
            Else
                Local numCoins := Self.killCoinMultiplier * 24.0
                New Item(location.x, location.y, "resource_coin0", False, numCoins, False)
            End If
        Else
            If Self.coinsToDrop
                Local numCoins := Self.coinsToDrop
                numCoins += Self.bonusCoinsToDrop
                numCoins *= controller_game.numPlayers
                numCoins *= Self.killCoinMultiplier
                numCoins += Self.ringOfGoldCoinsToDrop

                If Level.enemiesDropSingleCoinForThisLevel
                    numCoins = 1
                End If

                If numCoins > 0 And
                   (Not Self.dropNoCoinsOverride Or
                    Util.IsCharacterActive(Character.Monk) Or
                    Util.IsCharacterActive(Character.Coda))
                    Item.CreateAmountOfCoins(location.x, location.y, numCoins)
                End If
            End If
        End If

        If Self.deathTrigger <> 0
            Level.ActivateTrigger(Self.deathTrigger, Null, Null)
        End If

        Self.Delete()
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
        Self.x = xVal
        Self.y = yVal
        Self.lastX = xVal
        Self.lastY = yVal
        Self.level = l

        Self.xmlName = name

        For Local i := 0 Until Self.lastPlayerHitFrame.Length()
            Self.lastPlayerHitFrame[i] = -1
        End For

        For Local i := 0 Until Self.lastPlayerHitSource.Length()
            Self.lastPlayerHitSource[i] = ""
        End For

        Local enemyNode := Enemy.GetEnemyXML(name, l)
        ' TODO: Need `nullNode` behavior?
        If enemyNode = Null
            Debug.Log("ERROR: No enemy with name '" + name + "'")
        End If

        Self.enemyType = item.GetInt(enemyNode, "id", 0)
        Self.friendlyName = item.GetString(enemyNode, "friendlyName", Self.xmlName)

        Self.InitImage(enemyNode, name, overrideFrameW, overrideFrameH)

        Local statsNode := JsonObject(enemyNode.Get("stats"))
        Self.beatsPerMove = item.GetInt(statsNode, "beatsPerMove", 1)
        Self.coinsToDrop = item.GetInt(statsNode, "coinsToDrop", 1)
        Self.damagePerHit = item.GetInt(statsNode, "damagePerHit", 1)
        Self.movePriority = item.GetInt(statsNode, "priority", 0)
        Self.health = item.GetInt(statsNode, "health", 1)

        Local optionalStatsNode := JsonObject(enemyNode.Get("optionalStats"))
        Self.floating = item.GetBool(optionalStatsNode, "floating", False)
        Self.isMassive = item.GetBool(optionalStatsNode, "massive", False)
        Self.ignoreLiquids = item.GetBool(optionalStatsNode, "ignoreLiquids", False)
        Self.isMiniboss = item.GetBool(optionalStatsNode, "miniboss", False)
        Self.isBoss = item.GetBool(optionalStatsNode, "boss", False)
        Self.ignoreWalls = item.GetBool(optionalStatsNode, "ignoreWalls", False)
        Self.isMonkeyLike = item.GetBool(optionalStatsNode, "isMonkeyLike", False)

        If Self.isMassive
            Self.frozenImage = New Sprite("entities/frozen_feet_large.png", 31, 24, 2, Image.DefaultFlags)
        Else
            Self.frozenImage = New Sprite("entities/frozen_feet_medium.png", 31, 24, 2, Image.DefaultFlags)
        End If

        Local particleNode := JsonObject(enemyNode.Get("particle"))
        If particleNode <> Null
            Self.hitParticle = item.GetString(particleNode, "hit", "")
        End If

        Self.animNormal.Clear()
        Self.animNormal2.Clear()
        Self.animNormal3.Clear()
        Self.animBlink.Clear()
        Self.animTell.Clear()
        Self.animTellBlink.Clear()

        Local frameNodes := JsonArray(enemyNode.Get("frames")).GetData()
        For Local frameNodeValue := EachIn frameNodes
            Local frameNode := JsonObject(frameNodeValue)

            Local inSheet := item.GetInt(frameNode, "inSheet", 1)
            Local onFraction := item.GetFloat(frameNode, "onFraction", 1.0)
            Local offFraction := item.GetFloat(frameNode, "offFraction", 1.0)
            Local singleFrame := item.GetBool(frameNode, "singleFrame", False)

            Local beatAnimationData := New BeatAnimationData(inSheet - 1, onFraction, offFraction, singleFrame)

            Local animType := item.GetString(frameNode, "animType", "normal")
            Local inAnim := item.GetInt(frameNode, "inAnim", 1)

            Select animType
                Case "normal" Self.animNormal.Set(inAnim - 1, beatAnimationData)
                Case "normal2" Self.animNormal2.Set(inAnim - 1, beatAnimationData)
                Case "normal3" Self.animNormal3.Set(inAnim - 1, beatAnimationData)
                Case "blink" Self.animBlink.Set(inAnim - 1, beatAnimationData)
                Case "tell" Self.animTell.Set(inAnim - 1, beatAnimationData)
                Case "tellBlink" Self.animTellBlink.Set(inAnim - 1, beatAnimationData)
            End Select
        End For

        Local bouncerNode := JsonObject(enemyNode.Get("bouncer"))
        If bouncerNode <> Null
            Local min := item.GetFloat(bouncerNode, "min", 1.0)
            Local max := item.GetFloat(bouncerNode, "max", 1.0)
            Local power := item.GetFloat(bouncerNode, "power", 1.0)
            Local steps := item.GetInt(bouncerNode, "steps", 10)

            Self.bounce = New Bouncer(min, max, power, steps)
        End If

        Local tweensNode := JsonObject(enemyNode.Get("tweens"))
        If tweensNode <> Null
            ' TODO: Double check args.

            Local move := item.GetString(tweensNode, "move", "slide")
            If move = "slide" Then Self.moveTween = 3

            Local moveShadow := item.GetString(tweensNode, "moveShadow", "slide")
            If moveShadow = "slide" Then Self.moveShadowTween = 3

            Local hit := item.GetString(tweensNode, "hit", "slide")
            If hit = "slide" Then Self.hitTween = 3

            Local hitShadow := item.GetString(tweensNode, "hitShadow", "slide")
            If hitShadow = "slide" Then Self.hitShadowTween = 3
        End If

        Local movement := item.GetString(statsNode, "movement", "custom")
        Select movement
            Case "random" Self.movementType = 1
            Case "basicSeek" Self.movementType = 2
            Case "basicSeekNoTraps" Self.movementType = 3
            Case "seekWithDiagonals" Self.movementType = 4
            Case "randomWithDiagonals" Self.movementType = 5
            Default Self.movementType = 0
        End Select

        Self.attackSwipeImage = New Sprite("swipes/swipe_enemy.png", 5, Image.MidHandle)
        Self.attackSwipeImage.SetZOff(1000.0)

        Self.jumpDirt = New Sprite("particles/jump_dirt.png", 5, Image.MidHandle)
        Self.jumpDirt.SetZOff(-940.0)
        Self.jumpDirtTimer = -1

        If Enemy.heartSmall = Null
            Enemy.heartSmall = New Sprite("gui/TEMP_heart_small.png", 1, Image.MidHandle)
            Enemy.heartSmall.SetZ(900.0)
        End If

        If Enemy.heartEmptySmall = Null
            Enemy.heartEmptySmall = New Sprite("gui/TEMP_heart_empty_small.png", 1, Image.MidHandle)
            Enemy.heartEmptySmall.SetZ(900.0)
        End If

        If Self.isMiniboss
            Self.ActivateLight(0.01, 0.02)
        End If

        Self.ApplyMonkeyPaw()

        Local displayName := item.GetString(enemyNode, "displayName", Self.friendlyName)
        Debug.WriteLine("Placed " + displayName + " at " + (New Point(xVal, yVal)).ToString())
    End Method

    Method InitDirtJump: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.InitDirtJump(Int, Int)")
    End Method

    Method InitImage: Void(enemyXML: JsonObject, overrideSpriteName: String, overrideFrameW: Int, overrideFrameH: Int)
        Self.image = New Sprite("", 1, Image.DefaultFlags)

        Debug.TraceNotImplemented("Enemy.InitImage(JsonObject, String, Int, Int)")
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

    Method Compare: Int(a: Enemy, b: Enemy)
        Debug.TraceNotImplemented("EnemyList.Compare(Enemy, Enemy)")
    End Method

End Class

Class EnemyId

    Const None: Int = -1
    Const GreenSlime: Int = 0
    Const BlueSlime: Int = 1
    Const OrangeSlime: Int = 2
    Const WhiteSkeleton: Int = 3
    Const YellowSkeleton: Int = 4
    Const BlackSkeleton: Int = 5
    Const BlueBat: Int = 6
    Const RedBat: Int = 7
    Const GreenBat: Int = 8
    Const PurpleMonkey: Int = 9
    Const WhiteMonkey: Int = 10
    Const Ghost: Int = 11
    Const Zombie: Int = 12
    Const Wraith: Int = 13
    Const ChestMimic: Int = 14
    Const LockedChestMimic: Int = 15
    Const WhiteChestMimic: Int = 16
    Const WhiteArmoredSkeleton: Int = 100
    Const YellowArmoredSkeleton: Int = 101
    Const BlackArmoredSkeleton: Int = 102
    Const WhiteSkeletonMage: Int = 103
    Const YellowSkeletonMage: Int = 104
    Const BlackSkeletonMage: Int = 105
    Const BlueMushroom: Int = 106
    Const PurpleMushroom: Int = 107
    Const LightGolem: Int = 108
    Const DarkGolem: Int = 109
    Const WhiteArmadillo: Int = 110
    Const YellowArmadillo: Int = 111
    Const Clone: Int = 112
    Const TarMonster: Int = 113
    Const Mole: Int = 114
    Const Wight: Int = 115
    Const WallMimic: Int = 116
    Const MushroomLight: Int = 117
    Const ExplodingMushroom: Int = 118
    Const FireSlime: Int = 200
    Const IceSlime: Int = 201
    Const WhiteSkeletonKnight: Int = 202
    Const YellowSkeletonKnight: Int = 203
    Const BlackSkeletonKnight: Int = 204
    Const FireElemental: Int = 205
    Const IceElemental: Int = 206
    Const PurpleGoblin: Int = 207
    Const GrayGoblin: Int = 208
    Const FireBeetle: Int = 209
    Const IceBeetle: Int = 210
    Const Hellhound: Int = 211
    Const ShoveMonster: Int = 212
    Const Yeti: Int = 213
    Const Ghast: Int = 214
    Const FireCauldronMimic: Int = 215
    Const IceCauldronMimic: Int = 216
    Const FireCauldron: Int = 217
    Const IceCauldron: Int = 218
    Const GrayShoveMonster: Int = 219
    Const GoblinBomber: Int = 300
    Const GoblinSentry: Int = 301
    Const BlackBat: Int = 302
    Const OrangeArmadillo: Int = 303
    Const ApprenticeBlademaster: Int = 304
    Const Blademaster: Int = 305
    Const Ghoul: Int = 306
    Const OozeGolem: Int = 307
    Const Harpy: Int = 308
    Const Lich: Int = 309
    Const RedLich: Int = 310
    Const BlackLich: Int = 311
    Const GreenMonkey: Int = 312
    Const MagicMonkey: Int = 313
    Const Pixie: Int = 314
    Const Sarcophagus: Int = 315
    Const YellowSarcophagus: Int = 316
    Const BlackSarcophagus: Int = 317
    Const Spider: Int = 318
    Const Warlock: Int = 319
    Const NeonWarlock: Int = 320
    Const Mummy: Int = 321
    Const Gargoyle1: Int = 322
    Const Gargoyle2: Int = 323
    Const Gargoyle3: Int = 324
    Const Gargoyle4: Int = 325
    Const Gargoyle5: Int = 326
    Const Gargoyle6: Int = 327
    Const YellowDireBat: Int = 400
    Const BrownDireBat: Int = 401
    Const GreenDragon: Int = 402
    Const RedDragon: Int = 403
    Const BlueDragon: Int = 404
    Const BlueBanshee: Int = 405
    Const GreenBanshee: Int = 406
    Const LightMinotaur: Int = 407
    Const DarkMinotaur: Int = 408
    Const DarkNightmare: Int = 409
    Const BloodNightmare: Int = 410
    Const TheMommy: Int = 411
    Const Ogre: Int = 412
    Const GoldMetroGnome: Int = 413
    Const GreenMetroGnome: Int = 414
    Const EarthDragon: Int = 415
    Const Fortissimole: Int = 504
    Const Shopkeeper1: Int = 600
    Const Shopkeeper2: Int = 601
    Const Shopkeeper3: Int = 602
    Const Shopkeeper4: Int = 603
    Const ShopkeeperGhost: Int = 604
    Const MonstrousShopkeeper: Int = 605
    Const CrystalSkeleton: Int = 700
    Const WhiteSkull: Int = 701
    Const WaterBall: Int = 702
    Const PurpleElectricMage: Int = 704
    Const RedElectricMage: Int = 705
    Const GoldElectricMage: Int = 706
    Const PurpleElectricOrb: Int = 707
    Const RedElectricOrb: Int = 708
    Const GoldElectricOrb: Int = 709
    Const GreenGorgon: Int = 710
    Const ElectricZombie: Int = 711
    Const YellowSkull: Int = 712
    Const BlackSkull: Int = 713
    Const CrystalSkull: Int = 714
    Const CrystalArmoredSkeleton: Int = 715
    Const CrystalSkeletonKnight: Int = 716
    Const GreenEvilEye: Int = 717
    Const GoldGorgon: Int = 718
    Const PinkEvilEye: Int = 719
    Const GreenOrc: Int = 720
    Const PinkOrc: Int = 721
    Const PurpleOrc: Int = 722
    Const RedDevil: Int = 723
    Const GreenDevil: Int = 724
    Const PurpleSlime: Int = 725
    Const CursedWraith: Int = 726
    Const CrateMimic: Int = 727
    Const ShopWallMimic: Int = 728
    Const BlackSlime: Int = 729
    Const WhiteSlime: Int = 730
    Const BarrelMimic: Int = 731
    Const ShrineMimic: Int = 732
    Const TarBall: Int = 733
    Const Pawn: Int = 800
    Const RedPawn: Int = 801
    Const Knight: Int = 802
    Const RedKnight: Int = 803
    Const Bishop: Int = 804
    Const RedBishop: Int = 805
    Const Rook: Int = 806
    Const RedRook: Int = 807
    Const Queen: Int = 808
    Const RedQueen: Int = 809

End Class
