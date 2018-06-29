'Strict

Import monkey.list
Import monkey.map
Import monkey.math
Import mojo.graphics
Import enemy.npc.shopkeeper
Import enemy.armadillo
Import enemy.armoredskeleton
Import enemy.bat
Import enemy.beetle
IMport enemy.bishop
Import enemy.blademaster
Import enemy.cauldron
Import enemy.clone
Import enemy.devil
Import enemy.electric_mage
Import enemy.evileye
Import enemy.fakewall
Import enemy.fire_elemental
Import enemy.fortissimole
Import enemy.gargoyle
Import enemy.ghast
Import enemy.ghost
Import enemy.ghoul
Import enemy.goblin
Import enemy.goblin_bomber
Import enemy.golem
Import enemy.gorgon
Import enemy.harpy
Import enemy.hellhound
Import enemy.ice_elemental
Import enemy.knight
Import enemy.lich
Import enemy.mole
Import enemy.monkey_enemy
Import enemy.mushroom
Import enemy.mushroom_light
Import enemy.orc
Import enemy.pawn
Import enemy.pixie
Import enemy.queen
Import enemy.rook
Import enemy.shove_monster
Import enemy.skeleton
Import enemy.skeletonknight
Import enemy.skeletonmage
Import enemy.skull
Import enemy.sleeping_goblin
Import enemy.slime
Import enemy.spider
Import enemy.tarmonster
Import enemy.trapcauldron
Import enemy.trapchest
Import enemy.warlock
Import enemy.water_ball
Import enemy.wight
Import enemy.wraith
Import enemy.yeti
Import enemy.zombie
Import enemy.zombie_electric
Import audio2
Import beatanimationdata
Import entity
Import logger
Import mobileentity
Import necrodancergame
Import player_class
Import point
Import sprite
Import trap
Import util
Import xml

Class Enemy Extends MobileEntity Abstract

    Global enemiesFearfulDuration: Int
    Global enemiesPaused: Bool
    Global enemyList: EnemyList = New EnemyList()
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
        For Local enemy := EachIn Enemy.enemyList
            enemy.ApplyMonkeyPaw()
        End For
    End Function

    Function Charm: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.Charm(Int, Int)")
    End Function

    Function CreateLord: Void()
        For Local limit := 501 Until 0 Step -1
            Local enemyIndex := Util.RndIntRangeFromZero(Enemy.enemyList.Count() - 1, True)
            Local enemyArray := Enemy.enemyList.ToArray()
            Local enemy := enemyArray[enemyIndex]

            If enemy.CanBeLord()
                enemy.MakeLord()

                Return
            End If
        End For
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
        If Audio.fixedBeatNum = -64
            Return Audio.GetCurrentBeatNumberIncludingLoops(0, True) <= controller_game.lastEnemyMoveBeat
        End If

        Return Audio.GetCurrentBeatNumberIncludingLoops(0, True) < controller_game.lastEnemyMoveBeat
    End Function

    Function EnemiesMovingThisFrame: Bool()
        If Enemy.movesBehind > 0
            Return True
        End If

        If Not Player.PlayersHaveMovedThisBeat()
            Return False
        End If

        Return Not Enemy.EnemiesHaveMovedThisBeat()
    End Function

    Function FreezeEnemiesNear: Void(xVal: Int, yVal: Int, duration: Int, allEnemies: Bool)
        Debug.TraceNotImplemented("Enemy.FreezeEnemiesNear(Int, Int, Int, Bool)")
    End Function

    Function GetBaseType: Int(fullType: Int)
        Local enemiesNode := necrodancergame.xmlData.GetChildAtPath("enemies")

        Local enemyName: String
        For Local enemyNode := EachIn enemiesNode.GetChildrenWithAttributes("id=" + fullType)
            enemyName = enemyNode.name
        End For
        Debug.Assert(enemyName <> "")

        Local baseType := EnemyType.None
        For Local enemyNode := EachIn enemiesNode.GetChildren(enemyName, "type=1")
            Debug.Assert(enemyNode.HasAttribute("id"))

            baseType = enemyNode.GetAttribute("id", EnemyType.None)
        End For
        Debug.Assert(baseType <> EnemyType.None)

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

    Function GetEnemyXML: XMLNode(name: String, level: Int)
        Local enemyNode: XMLNode

        If Level.isRandomizerMode And
           Enemy.randomizerXML <> Null
            enemyNode = Enemy.randomizerXML.GetChildAtPath(name, "type=" + level)
        Else
            enemyNode = necrodancergame.xmlData.GetChildAtPath("enemies/" + name, "type=" + level)
        End If

        Return enemyNode
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
        Enemy.killingAllEnemies = True

        For Local enemy := EachIn Enemy.enemyList
            enemy.Die()
        End For
        
        Enemy.killingAllEnemies = False
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
            Case EnemyType.GreenSlime enemy = New Slime(xVal, yVal, 1)
            Case EnemyType.BlueSlime enemy = New Slime(xVal, yVal, 2)
            Case EnemyType.OrangeSlime enemy = New Slime(xVal, yVal, 3)
            Case EnemyType.WhiteSkeleton enemy = New Skeleton(xVal, yVal, 1)
            Case EnemyType.YellowSkeleton enemy = New Skeleton(xVal, yVal, 2)
            Case EnemyType.BlackSkeleton enemy = New Skeleton(xVal, yVal, 3)
            Case EnemyType.BlueBat enemy = New Bat(xVal, yVal, 1)
            Case EnemyType.RedBat enemy = New Bat(xVal, yVal, 2)
            Case EnemyType.GreenBat enemy = New Bat(xVal, yVal, 3)
            Case EnemyType.PurpleMonkey enemy = New Monkey(xVal, yVal, 1)
            Case EnemyType.WhiteMonkey enemy = New Monkey(xVal, yVal, 2)
            Case EnemyType.Ghost enemy = New Ghost(xVal, yVal, 1)
            Case EnemyType.Zombie enemy = New Zombie(xVal, yVal, 1)
            Case EnemyType.Wraith enemy = New Wraith(xVal, yVal, 1)
            Case EnemyType.ChestMimic enemy = New TrapChest(xVal, yVal, 1)
            Case EnemyType.LockedChestMimic enemy = New TrapChest(xVal, yVal, 2)
            Case EnemyType.WhiteChestMimic enemy = New TrapChest(xVal, yVal, 3)
            Case EnemyType.WhiteArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 1)
            Case EnemyType.YellowArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 2)
            Case EnemyType.BlackArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 3)
            Case EnemyType.WhiteSkeletonMage enemy = New SkeletonMage(xVal, yVal, 1)
            Case EnemyType.YellowSkeletonMage enemy = New SkeletonMage(xVal, yVal, 2)
            Case EnemyType.BlackSkeletonMage enemy = New SkeletonMage(xVal, yVal, 3)
            Case EnemyType.BlueMushroom enemy = New Mushroom(xVal, yVal, 1)
            Case EnemyType.PurpleMushroom enemy = New Mushroom(xVal, yVal, 2)
            Case EnemyType.LightGolem enemy = New Golem(xVal, yVal, 1)
            Case EnemyType.DarkGolem enemy = New Golem(xVal, yVal, 2)
            Case EnemyType.WhiteArmadillo enemy = New Armadillo(xVal, yVal, 1)
            Case EnemyType.YellowArmadillo enemy = New Armadillo(xVal, yVal, 2)
            Case EnemyType.Clone enemy = New Clone(xVal, yVal, 1)
            Case EnemyType.TarMonster enemy = New TarMonster(xVal, yVal, 1)
            Case EnemyType.Mole enemy = New Mole(xVal, yVal, 1)
            Case EnemyType.Wight enemy = New Wight(xVal, yVal, 1)
            Case EnemyType.WallMimic enemy = New FakeWall(xVal, yVal, 1)
            Case EnemyType.MushroomLight enemy = New MushroomLight(xVal, yVal, 1, True, False)
            Case EnemyType.ExplodingMushroom enemy = New MushroomLight(xVal, yVal, 1, False, True)
            Case EnemyType.FireSlime enemy = New Slime(xVal, yVal, 5)
            Case EnemyType.IceSlime enemy = New Slime(xVal, yVal, 4)
            Case EnemyType.WhiteSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 1)
            Case EnemyType.YellowSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 2)
            Case EnemyType.BlackSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 3)
            Case EnemyType.FireElemental enemy = New FireElemental(xVal, yVal, 1)
            Case EnemyType.IceElemental enemy = New IceElemental(xVal, yVal, 1)
            Case EnemyType.PurpleGoblin enemy = New Goblin(xVal, yVal, 1)
            Case EnemyType.GrayGoblin enemy = New Goblin(xVal, yVal, 2)
            Case EnemyType.FireBeetle enemy = New Beetle(xVal, yVal, 1)
            Case EnemyType.IceBeetle enemy = New Beetle(xVal, yVal, 2)
            Case EnemyType.Hellhound enemy = New Hellhound(xVal, yVal, 1)
            Case EnemyType.ShoveMonster enemy = New ShoveMonster(xVal, yVal, 1)
            Case EnemyType.GrayShoveMonster enemy = New ShoveMonster(xVal, yVal, 2)
            Case EnemyType.Yeti enemy = New Yeti(xVal, yVal, 1)
            Case EnemyType.Ghast enemy = New Ghast(xVal, yVal, 1)
            Case EnemyType.FireCauldronMimic enemy = New TrapCauldron(xVal, yVal, 1)
            Case EnemyType.IceCauldronMimic enemy = New TrapCauldron(xVal, yVal, 2)
            Case EnemyType.FireCauldron enemy = New Cauldron(xVal, yVal, 1)
            Case EnemyType.IceCauldron enemy = New Cauldron(xVal, yVal, 2)
            Case EnemyType.GoblinBomber enemy = New GoblinBomber(xVal, yVal, 1)
            Case EnemyType.GoblinSentry enemy = New SleepingGoblin(xVal, yVal, 1)
            Case EnemyType.BlackBat enemy = New Bat(xVal, yVal, 4)
            Case EnemyType.OrangeArmadillo enemy = New Armadillo(xVal, yVal, 3)
            Case EnemyType.ApprenticeBlademaster enemy = New Blademaster(xVal, yVal, 1)
            Case EnemyType.Blademaster enemy = New Blademaster(xVal, yVal, 2)
            Case EnemyType.Ghoul enemy = New Ghoul(xVal, yVal, 1)
            Case EnemyType.OozeGolem enemy = New Golem(xVal, yVal, 3)
            Case EnemyType.Harpy enemy = New Harpy(xVal, yVal, 1)
            Case EnemyType.Lich enemy = New Lich(xVal, yVal, 1)
            Case EnemyType.RedLich enemy = New Lich(xVal, yVal, 2)
            Case EnemyType.BlackLich enemy = New Lich(xVal, yVal, 3)
            Case EnemyType.GreenMonkey enemy = New Monkey(xVal, yVal, 3)
            Case EnemyType.MagicMonkey enemy = New Monkey(xVal, yVal, 4)
            Case EnemyType.Pixie enemy = New Pixie(xVal, yVal, 1)
            Case EnemyType.Sarcophagus enemy = New Sarcophagus(xVal, yVal, 1)
            Case EnemyType.YellowSarcophagus enemy = New Sarcophagus(xVal, yVal, 2)
            Case EnemyType.BlackSarcophagus enemy = New Sarcophagus(xVal, yVal, 3)
            Case EnemyType.Spider enemy = New Spider(xVal, yVal, 1)
            Case EnemyType.Warlock enemy = New Warlock(xVal, yVal, 1)
            Case EnemyType.NeonWarlock enemy = New Warlock(xVal, yVal, 2)
            Case EnemyType.Mummy enemy = New Mummy(xVal, yVal, 1)
            Case EnemyType.Gargoyle1 enemy = New Gargoyle(xVal, yVal, 1)
            Case EnemyType.Gargoyle2 enemy = New Gargoyle(xVal, yVal, 2)
            Case EnemyType.Gargoyle3 enemy = New Gargoyle(xVal, yVal, 3)
            Case EnemyType.Gargoyle4 enemy = New Gargoyle(xVal, yVal, 4)
        End Select

        Return enemy
    End Function

    Function MakeEnemy2: Enemy(xVal: Int, yVal: Int, type: Int)
        Local enemy: Enemy

        Select type
            Case EnemyType.Gargoyle5 enemy = New Gargoyle(xVal, yVal, 5)
            Case EnemyType.Gargoyle6 enemy = New Gargoyle(xVal, yVal, 6)
            Case EnemyType.YellowDireBat enemy = New BatMiniboss(xVal, yVal, 1)
            Case EnemyType.BrownDireBat enemy = New BatMiniboss(xVal, yVal, 2)
            Case EnemyType.GreenDragon enemy = New Dragon(xVal, yVal, 1)
            Case EnemyType.RedDragon enemy = New Dragon(xVal, yVal, 2)
            Case EnemyType.BlueDragon enemy = New Dragon(xVal, yVal, 3)
            Case EnemyType.BlueBanshee enemy = New Banshee(xVal, yVal, 1)
            Case EnemyType.GreenBanshee enemy = New Banshee(xVal, yVal, 2)
            Case EnemyType.LightMinotaur enemy = New Minotaur(xVal, yVal, 1)
            Case EnemyType.DarkMinotaur enemy = New Minotaur(xVal, yVal, 2)
            Case EnemyType.DarkNightmare enemy = New Nightmare(xVal, yVal, 1)
            Case EnemyType.BloodNightmare enemy = New Nightmare(xVal, yVal, 2)
            Case EnemyType.TheMommy enemy = New Mommy(xVal, yVal, 1)
            Case EnemyType.Ogre enemy = New Ogre(xVal, yVal, 1)
            Case EnemyType.GoldMetroGnome enemy = New MetroGnome(xVal, yVal, 1)
            Case EnemyType.GreenMetroGnome enemy = New MetroGnome(xVal, yVal, 2)
            Case EnemyType.EarthDragon enemy = New Dragon(xVal, yVal, 4)
            Case EnemyType.Shopkeeper1 enemy = New Shopkeeper(xVal, yVal, 1, False)
            Case EnemyType.Shopkeeper2 enemy = New Shopkeeper(xVal, yVal, 2, False)
            Case EnemyType.Shopkeeper3 enemy = New Shopkeeper(xVal, yVal, 3, False)
            Case EnemyType.Shopkeeper4 enemy = New Shopkeeper(xVal, yVal, 4, False)
            Case EnemyType.ShopkeeperGhost enemy = New ShopkeeperGhost(xVal, yVal, 1)
            Case EnemyType.MonstrousShopkeeper enemy = New Shopkeeper(xVal, yVal, 5, False)
            Case EnemyType.CrystalSkeleton enemy = New Skeleton(xVal, yVal, 4)
            Case EnemyType.WhiteSkull enemy = New Skull(xVal, yVal, 1)
            Case EnemyType.YellowSkull enemy = New Skull(xVal, yVal, 2)
            Case EnemyType.BlackSkull enemy = New Skull(xVal, yVal, 3)
            Case EnemyType.CrystalSkull enemy = New Skull(xVal, yVal, 4)
            Case EnemyType.Fortissimole enemy = New Fortissimole(xVal, yVal, 1)
            Case EnemyType.Pawn enemy = New Pawn(xVal, yVal, 1)
            Case EnemyType.RedPawn enemy = New Pawn(xVal, yVal, 2)
            Case EnemyType.Knight enemy = New Knight(xVal, yVal, 1)
            Case EnemyType.RedKnight enemy = New Knight(xVal, yVal, 2)
            Case EnemyType.Bishop enemy = New Bishop(xVal, yVal, 1)
            Case EnemyType.RedBishop enemy = New Bishop(xVal, yVal, 2)
            Case EnemyType.Rook enemy = New Rook(xVal, yVal, 1)
            Case EnemyType.RedRook enemy = New Rook(xVal, yVal, 2)
            Case EnemyType.Queen enemy = New Queen(xVal, yVal, 1)
            Case EnemyType.RedQueen enemy = New Queen(xVal, yVal, 2)
            Case EnemyType.WaterBall enemy = New WaterBall(xVal, yVal, 1)
            Case EnemyType.PurpleElectricMage enemy = New ElectricMage(xVal, yVal, 1)
            Case EnemyType.RedElectricMage enemy = New ElectricMage(xVal, yVal, 2)
            Case EnemyType.GoldElectricMage enemy = New ElectricMage(xVal, yVal, 3)
            Case EnemyType.GreenGorgon enemy = New Gorgon(xVal, yVal, 1)
            Case EnemyType.ElectricZombie enemy = New ZombieElectric(xVal, yVal, 1)
            Case EnemyType.CrystalArmoredSkeleton enemy = New ArmoredSkeleton(xVal, yVal, 4)
            Case EnemyType.CrystalSkeletonKnight enemy = New SkeletonKnight(xVal, yVal, 4)
            Case EnemyType.GreenEvilEye enemy = New EvilEye(xVal, yVal, 1)
            Case EnemyType.GoldGorgon enemy = New Gorgon(xVal, yVal, 2)
            Case EnemyType.PinkEvilEye enemy = New EvilEye(xVal, yVal, 2)
            Case EnemyType.GreenOrc enemy = New Orc(xVal, yVal, 1)
            Case EnemyType.PinkOrc enemy = New Orc(xVal, yVal, 2)
            Case EnemyType.PurpleOrc enemy = New Orc(xVal, yVal, 3)
            Case EnemyType.RedDevil enemy = New Devil(xVal, yVal, 1)
            Case EnemyType.GreenDevil enemy = New Devil(xVal, yVal, 2)
            Case EnemyType.PurpleSlime enemy = New Slime(xVal, yVal, 6)
            Case EnemyType.CursedWraith enemy = New Wraith(xVal, yVal, 2)
            Case EnemyType.CrateMimic enemy = New TrapChest(xVal, yVal, 4)
            Case EnemyType.ShopWallMimic enemy = New FakeWall(xVal, yVal, 2)
            Case EnemyType.BlackSlime enemy = New Slime(xVal, yVal, 7)
            Case EnemyType.WhiteSlime enemy = New Slime(xVal, yVal, 8)
            Case EnemyType.BarrelMimic enemy = New TrapChest(xVal, yVal, 5)
            Case EnemyType.ShrineMimic enemy = New TrapChest(xVal, yVal, 6)
            Case EnemyType.TarBall enemy = New WaterBall(xVal, yVal, 2)
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
        For Local enemy := EachIn Enemy.enemyList
            If Not enemy.swarmCulprit Then Continue

            Local xOff := 0
            Local yOff := 0

            If math.Abs(enemy.x) > math.Abs(enemy.y)
                If enemy.x < 0
                    xOff = -1
                Else
                    xOff = 1
                End If
            Else
                If enemy.y < 0
                    yOff = -1
                Else
                    yOff = 1
                End If
            End If

            Local x := enemy.x
            Local y := enemy.y

            Local originalX := x
            Local originalY := y

            Repeat
                enemy.x = x
                enemy.y = y

                x += xOff
                y += yOff
            Until Util.IsGlobalCollisionAt(x, y, False, False, False, False) Or
                  Trap.IsLiveTrapAt(x, y)

            If enemy.x <> originalX Or
               enemy.y <> originalY
                Local enemyNode := Enemy.GetEnemyXML(enemy.xmlName, enemy.level)
                Local displayName := enemyNode.GetAttribute("displayName", enemy.friendlyName)
                Debug.WriteLine("Moved " + displayName + " from " + (New Point(originalX, originalY)).ToString() + " to " + (New Point(enemy.x, enemy.y)).ToString())
            End If
        End For
    End Function

    Function ResetAll: Void()
        Debug.TraceNotImplemented("Enemy.ResetAll()")
    End Function

    Function SetAllEnemiesMinimumMoveDistance: Void(dist: Int)
        For Local enemy := EachIn Enemy.enemyList
            enemy.minEnemyMoveDistance = 5
        End For
    End Function

    Function SetAllNonNecroDancerEnemyMoveDelays: Void(cmd: Int)
        Debug.TraceNotImplemented("Enemy.SetAllNonNecroDancerEnemyMoveDelays(Int)")
    End Function

    Function SetEnemiesToDropNoCoins: Void()
        For Local enemy := EachIn Enemy.enemyList
            enemy.coinsToDrop = 0
        End For
    End Function

    Function SetEnemiesToDropNoCoinsOverride: Void()
        For Local enemy := EachIn Enemy.enemyList
            enemy.dropNoCoinsOverride = True
        End For
    End Function

    Function StartRandomizerRun: Void()
        Local enemiesNode := necrodancergame.xmlData.GetChildAtPath("enemies")
        Local enemiesXMLStr := enemiesNode.Export()
        Enemy.randomizerXML = xml.ParseXML(enemiesXMLStr)

        For Local enemyNode := EachIn Enemy.randomizerXML.GetChildren()
            Select enemyNode.name
                Case "crate",
                     "bell",
                     "conductor",
                     "conductor_battery",
                     "conductor_prop",
                     "frankensteinway",
                     "frankensteinway_prop",
                     "dead_ringer",
                     "lute_dragon",
                     "lute_head",
                     "necrodancer",
                     "fortissimole",
                     "medic"
                    Continue
            End Select

            Local statsNode := enemyNode.GetChild("stats")
            
            Local optionalStatsNode := enemyNode.GetChild("optionalStats")
            If optionalStatsNode = enemyNode.doc.nullNode
                optionalStatsNode = enemyNode.AddChild("optionalStats", "")
            End If

            ' Beats per move

            Local beatsPerMoveRoll := Util.RndIntRangeFromZero(99, True)
            If enemyNode.name = "pawn"
                beatsPerMoveRoll += 30
            End If

            Local beatsPerMove: Int
            If beatsPerMoveRoll < 30 And
               enemyNode.name <> "yeti" And
               enemyNode.name <> "mushroom"
                beatsPerMove = 1
            Else If beatsPerMoveRoll < 70
                beatsPerMove = 2
            Else If beatsPerMoveRoll < 90
                beatsPerMove = 3
            Else
                beatsPerMove = 4
            End If

            statsNode.SetAttribute("beatsPerMove", beatsPerMove)

            ' Coins to drop

            Local coinsToDrop: Int
            Select enemyNode.name
                Case "mummy",
                     "electric_orb"
                    coinsToDrop = 0
                Default
                    coinsToDrop = Util.RndIntRange(1, 9, True)
            End Select

            statsNode.SetAttribute("coinsToDrop", coinsToDrop)

            ' Damage per hit

            Local damagePerHitRoll := Util.RndIntRangeFromZero(99, True)
            Local isMiniboss := optionalStatsNode.GetAttribute("miniboss")
            Local isBoss := optionalStatsNode.GetAttribute("boss")
            If isMiniboss Or
               isBoss
                damagePerHitRoll += 20
            End If

            Local damagePerHit: Int
            If damagePerHitRoll < 30
                damagePerHit = 1
            Else If damagePerHitRoll < 50
                damagePerHit = 2
            Else If damagePerHitRoll < 70
                damagePerHit = 3
            Else If damagePerHitRoll < 80
                damagePerHit = 4
            Else If damagePerHitRoll < 90
                damagePerHit = 5
            Else
                damagePerHit = 6
            End If

            statsNode.SetAttribute("damagePerHit", damagePerHit)

            ' Health

            Local enemyType := enemyNode.GetAttribute("type", 1)

            Local health: Int
            If beatsPerMove = 1 Or
               (enemyNode.name = "shopkeeper" And
                (enemyType = 4 Or
                 enemyType = 9))
                health = 1
            Else
                Local healthRoll := Util.RndIntRangeFromZero(99, True)
                If enemyNode.name = "pawn"
                    healthRoll -= 30
                Else If isMiniboss Or
                        isBoss
                    healthRoll += 15
                End If

                If healthRoll < 50
                    health = 1
                Else If healthRoll < 70
                    health = 2
                Else If healthRoll < 80
                    health = 3
                Else If healthRoll < 85
                    health = 4
                Else If healthRoll < 90
                    health = 5
                Else If healthRoll < 100
                    health = healthRoll - 89
                Else
                    health = healthRoll - 99
                End If
            End If

            statsNode.SetAttribute("health", health)

            ' Ignore walls

            Local ignoreWallsRoll := Util.RndIntRangeFromZero(19, True)
            If ignoreWallsRoll = 0
                optionalStatsNode.SetAttribute("ignoreWalls", True)
            End If

            ' Movement

            Local movementRoll := Util.RndIntRangeFromZero(99, True)
            Local movement: String
            If movementRoll < 50
                movement = "basicSeek"
            Else if movementRoll < 65
                movement = "random"
            Else if movementRoll < 85
                movement = "seekWithDiagonals"
            Else
                movement = "randomWithDiagonals"
            End If

            statsNode.SetAttribute("movement", movement)

            ' Miscellaneous attributes

            Local miscellaneousAttributesRoll := Util.RndIntRangeFromZero(9, True)
            If miscellaneousAttributesRoll = 0
                optionalStatsNode.SetAttribute("floating", True)
                optionalStatsNode.SetAttribute("bounceOnMovementFail", False)

                Local tweensNode := enemyNode.GetChild("tweens")
                If tweensNode = enemyNode.doc.nullNode
                    tweensNode = enemyNode.AddChild("tweens")
                End If

                tweensNode.SetAttribute("move", "slide")
                tweensNode.SetAttribute("moveShadow", "slide")
                tweensNode.SetAttribute("hit", "slide")
                tweensNode.SetAttribute("hitShadow", "slide")

                Local bouncerNode := enemyNode.GetChild("bouncer")
                If bouncerNode = enemyNode.doc.nullNode
                    bouncerNode = enemyNode.AddChild("bouncer")
                End If

                bouncerNode.SetAttribute("min", -2.5)
                bouncerNode.SetAttribute("max", 0)
                bouncerNode.SetAttribute("power", 1.5)
                bouncerNode.SetAttribute("steps", 15)
            Else
                optionalStatsNode.SetAttribute("floating", False)
                optionalStatsNode.SetAttribute("bounceOnMovementFail", True)

                Local tweensNode := enemyNode.GetChild("tweens")
                If tweensNode <> enemyNode.doc.nullNode
                    enemyNode.RemoveChild(tweensNode)
                End If

                Local bouncerNode := enemyNode.GetChild("bouncer")
                If bouncerNode <> enemyNode.doc.nullNode
                    enemyNode.RemoveChild(bouncerNode)
                End If
            End If
        End For
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
        Return Not Self.isMiniboss And
               Not Self.isLord And
               Self.beatsPerMove > 1
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

    Method Init: Void(xVal: Int, yVal: Int, l: Int, name: String)
        Self.Init(xVal, yVal, l, name, "")
    End Method

    Method Init: Void(xVal: Int, yVal: Int, l: Int, name: String, overrideSpriteName: String)
        Self.Init(xVal, yVal, l, name, overrideSpriteName, -1, -1)
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
        If enemyNode = necrodancergame.xmlData.doc.nullNode
            Debug.Log("ERROR: No enemy with name '" + name + "'")
        End If

        Self.enemyType = enemyNode.GetAttribute("id", 0)
        Self.friendlyName = enemyNode.GetAttribute("friendlyName", Self.xmlName)

        Self.InitImage(enemyNode, name, overrideFrameW, overrideFrameH)

        Local statsNode := enemyNode.GetChild("stats")
        Self.beatsPerMove = statsNode.GetAttribute("beatsPerMove", 1)
        Self.coinsToDrop = statsNode.GetAttribute("coinsToDrop", 1)
        Self.damagePerHit = statsNode.GetAttribute("damagePerHit", 1)
        Self.movePriority = statsNode.GetAttribute("priority", 0)
        Self.health = statsNode.GetAttribute("health", 1)

        Local optionalStatsNode := enemyNode.GetChild("optionalStats")
        Self.floating = optionalStatsNode.GetAttribute("floating", False)
        Self.isMassive = optionalStatsNode.GetAttribute("massive", False)
        Self.ignoreLiquids = optionalStatsNode.GetAttribute("ignoreLiquids", False)
        Self.isMiniboss = optionalStatsNode.GetAttribute("miniboss", False)
        Self.isBoss = optionalStatsNode.GetAttribute("boss", False)
        Self.ignoreWalls = optionalStatsNode.GetAttribute("ignoreWalls", False)
        Self.isMonkeyLike = optionalStatsNode.GetAttribute("isMonkeyLike", False)

        If Self.isMassive
            Self.frozenImage = New Sprite("entities/frozen_feet_large.png", 31, 24, 2, Image.DefaultFlags)
        Else
            Self.frozenImage = New Sprite("entities/frozen_feet_medium.png", 31, 24, 2, Image.DefaultFlags)
        End If

        Local particleNode := enemyNode.GetChild("particle")
        Self.hitParticle = particleNode.GetAttribute("hit", "")

        Self.animNormal.Clear()
        Self.animNormal2.Clear()
        Self.animNormal3.Clear()
        Self.animBlink.Clear()
        Self.animTell.Clear()
        Self.animTellBlink.Clear()

        For Local frameNode := EachIn enemyNode.GetChildren("frame")
            Local inSheet := frameNode.GetAttribute("inSheet", 1)
            Local onFraction := frameNode.GetAttribute("onFraction", 1.0)
            Local offFraction := frameNode.GetAttribute("offFraction", 1.0)
            Local singleFrame := frameNode.GetAttribute("singleFrame", False)

            Local beatAnimationData := New BeatAnimationData(inSheet - 1, onFraction, offFraction, singleFrame)

            Local animType := frameNode.GetAttribute("animType", "normal")
            Local inAnim := frameNode.GetAttribute("inAnim", 1)

            Select animType
                Case "normal" Self.animNormal.Set(inAnim - 1, beatAnimationData)
                Case "normal2" Self.animNormal2.Set(inAnim - 1, beatAnimationData)
                Case "normal3" Self.animNormal3.Set(inAnim - 1, beatAnimationData)
                Case "blink" Self.animBlink.Set(inAnim - 1, beatAnimationData)
                Case "tell" Self.animTell.Set(inAnim - 1, beatAnimationData)
                Case "tellBlink" Self.animTellBlink.Set(inAnim - 1, beatAnimationData)
            End Select
        End For

        Local bouncerNodes := enemyNode.GetChildren("bouncer")
        If bouncerNodes.Count() > 0
            Local bouncerNode := enemyNode.GetChild("bouncer")

            Local min := bouncerNode.GetAttribute("min", 1.0)
            Local max := bouncerNode.GetAttribute("max", 1.0)
            Local power := bouncerNode.GetAttribute("power", 1.0)
            Local steps := bouncerNode.GetAttribute("steps", 10)

            Self.bounce = New Bouncer(min, max, power, steps)
        End If

        Local tweensNodes := enemyNode.GetChildren("tweens")
        If tweensNodes.Count() > 0
            Local tweensNode := enemyNode.GetChild("tweens")

            ' TODO: Double check args.

            Local move := tweensNode.GetAttribute("move", "slide")
            If move = "slide" Then Self.moveTween = 3

            Local moveShadow := tweensNode.GetAttribute("moveShadow", "slide")
            If moveShadow = "slide" Then Self.moveShadowTween = 3

            Local hit := tweensNode.GetAttribute("hit", "slide")
            If hit = "slide" Then Self.hitTween = 3

            Local hitShadow := tweensNode.GetAttribute("hitShadow", "slide")
            If hitShadow = "slide" Then Self.hitShadowTween = 3
        End If

        Local movement := statsNode.GetAttribute("movement", "custom")
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

        Local displayName := enemyNode.GetAttribute("displayName", Self.friendlyName)
        Debug.WriteLine("Placed " + displayName + " at " + (New Point(xVal, yVal)).ToString())
    End Method

    Method InitDirtJump: Void(xVal: Int, yVal: Int)
        Debug.TraceNotImplemented("Enemy.InitDirtJump(Int, Int)")
    End Method

    Method InitImage: Void(enemyXML: XMLNode, overrideSpriteName: String, overrideFrameW: Int, overrideFrameH: Int)
        Self.image = New Sprite()
        Self.shadow = New Sprite()

        Debug.TraceNotImplemented("Enemy.InitImage(XMLNode, String, Int, Int)")
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

    Method MakeDancer: Void()
        Self.isDancer = True
        Self.shadowYOff -= 8
        Self.yOff -= 8.0
        Self.shadow.UnSetZ()
        Self.shadow.SetZOff(Self.image.zOff + 24.0)
        Self.image.SetZOff(Self.image.zOff + 124.0)
    End Method

    Method MakeLord: Void()
        Self.healthMax *= 2
        Self.health *= 2
        Self.damagePerHit *= 2
        Self.isLord = True
        Self.isMassive = True

        Local dropLordScrollRoll := Util.RndIntRangeFromZero(2, True)
        Self.dropLordScroll = (dropLordScrollRoll = 0)

        Self.AdjustLordImage()
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

Class EnemyType

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

Class EnemyBaseType

    Const Slime: Int = 0
    Const Skeleton: Int = 3
    Const Bat: Int = 6
    Const Monkey: Int = 9
    Const Ghost: Int = 11
    Const Zombie: Int = 12
    Const Wraith: Int = 13
    Const TrapChest: Int = 14
    Const ArmoredSkeleton: Int = 100
    Const SkeletonMage: Int = 103
    Const Mushroom: Int = 106
    Const Golem: Int = 108
    Const Armadillo: Int = 110
    Const Clone: Int = 112
    Const TarMonster: Int = 113
    Const Mole: Int = 114
    Const Wight: Int = 115
    Const FakeWall: Int = 116
    Const MushroomLight: Int = 117
    Const MushroomExploding: Int = 118
    Const SkeletonKnight: Int = 202
    Const FireElemental: Int = 205
    Const IceElemental: Int = 206
    Const Goblin: Int = 207
    Const Beetle: Int = 209
    Const Hellhound: Int = 211
    Const ShoveMonster: Int = 212
    Const Yeti: Int = 213
    Const Ghast: Int = 214
    Const TrapCauldron: Int = 215
    Const Cauldron: Int = 217
    Const GoblinBomber: Int = 300
    Const SleepingGoblin: Int = 301
    Const Blademaster: Int = 304
    Const Ghoul: Int = 306
    Const Harpy: Int = 308
    Const Lich: Int = 309
    Const Pixie: Int = 314
    Const Sarcophagus: Int = 315
    Const Spider: Int = 318
    Const Warlock: Int = 319
    Const Mummy: Int = 321
    Const Gargoyle: Int = 322
    Const BatMiniboss: Int = 400
    Const Dragon: Int = 402
    Const Banshee: Int = 405
    Const Minotaur: Int = 407
    Const Nightmare: Int = 409
    Const Mommy: Int = 411
    Const Ogre: Int = 412
    Const MetroGnome: Int = 413
    Const Shopkeeper: Int = 600
    Const ShopkeeperGhost: Int = 604
    Const Skull: Int = 701
    Const WaterBall: Int = 702
    Const ElectricMage: Int = 704
    Const ElectricOrb: Int = 707
    Const Gorgon: Int = 710
    Const ZombieElectric: Int = 711
    Const EvilEye: Int = 717
    Const Orc: Int = 720
    Const Devil: Int = 723
    Const Pawn: Int = 800
    Const Knight: Int = 802
    Const Bishop: Int = 804
    Const Rook: Int = 806
    Const Queen: Int = 808

End Class
