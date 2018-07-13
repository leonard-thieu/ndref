'Strict

Import monkey.list
Import monkey.map
Import monkey.math
Import mojo.graphics
Import controller.controller_game
Import enemy.npc
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
Import familiar_fixed
Import level
Import trap
Import audio2
Import beatanimationdata
Import camera
Import chain
Import entity
Import logger
Import mobileentity
Import necrodancergame
Import player_class
Import point
Import sprite
Import textlog
Import tile
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

    Function AddTagsToEnemyName: String(eName: String, size: Int)
        eName = eName.ToUpper()

        Local enemyName: String

        ' NOTE: This function is split into multiple functions to work around an MSVC compiler limit (hard limit of 128 nesting levels).
        '       Monkey X transpiles `Select` statements into chained `else-if` clauses when targeting C++. This causes the deep nesting.
        Select size
            Case 1
                enemyName = Enemy.AddTagsToEnemyName_Size1(eName)
            Default
                enemyName = Enemy.AddTagsToEnemyName_SizeDefault(eName)
        End Select

        If enemyName = ""
            Debug.Log("WARNING: Missing localization tags for enemy name ~q" + eName + "~q")

            enemyName = eName
        End If

        Return enemyName
    End Function

    Function AddTagsToEnemyName_Size1: String(eName: String)
        Local enemyName: String

        enemyName = Enemy.AddTagsToEnemyName_Size1_1(eName)
        If enemyName <> "" Then Return enemyName

        enemyName = Enemy.AddTagsToEnemyName_Size1_2(eName)
        If enemyName <> "" Then Return enemyName

        enemyName = Enemy.AddTagsToEnemyName_Size1_3(eName)
        If enemyName <> "" Then Return enemyName

        Return enemyName
    End Function

    Function AddTagsToEnemyName_Size1_1: String(eName: String)
        Local enemyName: String

        Select eName
            Case "WHITE ARMADILLO"
                enemyName = "|4000|WHITE ARMADILLO|"
            Case "YELLOW ARMADILLO"
                enemyName = "|4001|YELLOW ARMADILLO|"
            Case "ORANGE ARMADILLO"
                enemyName = "|4002|ORANGE ARMADILLO|"
            Case "WHITE ARMORED SKELETON"
                enemyName = "|4003|WHITE ARMORED SKELETON|"
            Case "YELLOW ARMORED SKELETON"
                enemyName = "|4004|YELLOW ARMORED SKELETON|"
            Case "BLACK ARMORED SKELETON"
                enemyName = "|4005|BLACK ARMORED SKELETON|"
            Case "BLUE BANSHEE"
                enemyName = "|4006|BLUE BANSHEE|"
            Case "GREEN BANSHEE"
                enemyName = "|4007|GREEN BANSHEE|"
            Case "BLUE BAT"
                enemyName = "|4008|BLUE BAT|"
            Case "RED BAT"
                enemyName = "|4009|RED BAT|"
            Case "GREEN BAT"
                enemyName = "|4010|GREEN BAT|"
            Case "BLACK BAT"
                enemyName = "|4011|BLACK BAT|"
            Case "YELLOW DIREBAT"
                enemyName = "|4012|YELLOW DIREBAT|"
            Case "BROWN DIREBAT"
                enemyName = "|4013|BROWN DIREBAT|"
            Case "FIRE BEETLE"
                enemyName = "|4014|FIRE BEETLE|"
            Case "ICE BEETLE"
                enemyName = "|4015|ICE BEETLE|"
            Case "BISHOP"
                enemyName = "|4016|BISHOP|"
            Case "RED BISHOP"
                enemyName = "|4017|RED BISHOP|"
            Case "APPRENTICE BLADEMASTER"
                enemyName = "|4018|APPRENTICE BLADEMASTER|"
            Case "BLADEMASTER"
                enemyName = "|4019|BLADEMASTER|"
            Case "CLONE"
                enemyName = "|4020|CLONE|"
            Case "CORAL RIFF"
                enemyName = "|4021|CORAL RIFF|"
            Case "BARREL"
                enemyName = "|4022|BARREL|"
            Case "DEAD RINGER"
                enemyName = "|4023|DEAD RINGER|"
            Case "DEATH METAL"
                enemyName = "|4024|DEATH METAL|"
            Case "GREEN DRAGON"
                enemyName = "|4025|GREEN DRAGON|"
            Case "RED DRAGON"
                enemyName = "|4026|RED DRAGON|"
            Case "BLUE DRAGON"
                enemyName = "|4027|BLUE DRAGON|"
            Case "WALL MIMIC"
                enemyName = "|4028|WALL MIMIC|"
            Case "FIRE ELEMENTAL"
                enemyName = "|4029|FIRE ELEMENTAL|"
            Case "GARGOYLE"
                enemyName = "|4030|GARGOYLE|"
            Case "GHAST"
                enemyName = "|4031|GHAST|"
            Case "GHOST"
                enemyName = "|4032|GHOST|"
            Case "GHOUL"
                enemyName = "|4033|GHOUL|"
            Case "PURPLE GOBLIN"
                enemyName = "|4034|PURPLE GOBLIN|"
            Case "GRAY GOBLIN"
                enemyName = "|4035|GRAY GOBLIN|"
            Case "GOBLIN BOMBER"
                enemyName = "|4036|GOBLIN BOMBER|"
            Case "LIGHT GOLEM"
                enemyName = "|4037|LIGHT GOLEM|"
            Case "DARK GOLEM"
                enemyName = "|4038|DARK GOLEM|"
            Case "OOZE GOLEM"
                enemyName = "|4039|OOZE GOLEM|"
            Case "HARPY"
                enemyName = "|4040|HARPY|"
            Case "HELLHOUND"
                enemyName = "|4041|HELLHOUND|"
            Case "ICE ELEMENTAL"
                enemyName = "|4042|ICE ELEMENTAL|"
            Case "KING"
                enemyName = "|4043|KING|"
            Case "RED KING"
                enemyName = "|4044|RED KING|"
            Case "KING CONGA"
                enemyName = "|4045|KING CONGA|"
            Case "KNIGHT"
                enemyName = "|4046|KNIGHT|"
            Case "RED KNIGHT"
                enemyName = "|4047|RED KNIGHT|"
            Case "LEPRECHAUN"
                enemyName = "|4048|LEPRECHAUN|"
            Case "LICH"
                enemyName = "|4049|LICH|"
            Case "RED LICH"
                enemyName = "|4050|RED LICH|"
            Case "BLACK LICH"
                enemyName = "|4051|BLACK LICH|"
            Case "THE GOLDEN LUTE"
                enemyName = "|4052|THE GOLDEN LUTE|"
            Case "LIGHT MINOTAUR"
                enemyName = "|4053|LIGHT MINOTAUR|"
            Case "DARK MINOTAUR"
                enemyName = "|4054|DARK MINOTAUR|"
            Case "MOLE"
                enemyName = "|4055|MOLE|"
            Case "PURPLE MONKEY"
                enemyName = "|4056|PURPLE MONKEY|"
            Case "WHITE MONKEY"
                enemyName = "|4057|WHITE MONKEY|"
            Case "GREEN MONKEY"
                enemyName = "|4058|GREEN MONKEY|"
            Case "MAGIC MONKEY"
                enemyName = "|4059|MAGIC MONKEY|"
            Case "THE MOMMY"
                enemyName = "|4060|THE MOMMY|"
            Case "MUMMY"
                enemyName = "|4061|MUMMY|"
            Case "BLUE MUSHROOM"
                enemyName = "|4062|BLUE MUSHROOM|"
            Case "PURPLE MUSHROOM"
                enemyName = "|4063|PURPLE MUSHROOM|"
            Case "EXPLODING MUSHROOM"
                enemyName = "|4064|EXPLODING MUSHROOM|"
            Case "THE NECRODANCER"
                enemyName = "|4065|THE NECRODANCER|"
            Case "DARK NIGHTMARE"
                enemyName = "|4066|DARK NIGHTMARE|"
            Case "BLOOD NIGHTMARE"
                enemyName = "|4067|BLOOD NIGHTMARE|"
            Case "OGRE"
                enemyName = "|4068|OGRE|"
            Case "PAWN"
                enemyName = "|4069|PAWN|"
            Case "RED PAWN"
                enemyName = "|4070|RED PAWN|"
            Case "PIXIE"
                enemyName = "|4071|PIXIE|"
            Case "QUEEN"
                enemyName = "|4072|QUEEN|"
            Case "RED QUEEN"
                enemyName = "|4073|RED QUEEN|"
            Case "ROOK"
                enemyName = "|4074|ROOK|"
            Case "RED ROOK"
                enemyName = "|4075|RED ROOK|"
            Case "SARCOPHAGUS"
                enemyName = "|4076|SARCOPHAGUS|"
            Case "YELLOW SARCOPHAGUS"
                enemyName = "|4077|YELLOW SARCOPHAGUS|"
            Case "BLACK SARCOPHAGUS"
                enemyName = "|4078|BLACK SARCOPHAGUS|"
            Case "SHOPKEEPER"
                enemyName = "|4079|SHOPKEEPER|"
            Case "MONSTROUS SHOPKEEPER"
                enemyName = "|4080|MONSTROUS SHOPKEEPER|"
            Case "SHOPKEEPER GHOST"
                enemyName = "|4081|SHOPKEEPER GHOST|"
        End Select

        Return enemyName
    End Function

    Function AddTagsToEnemyName_Size1_2: String(eName: String)
        Local enemyName: String

        Select eName
            Case "SHOVEMONSTER"
                enemyName = "|4082|SHOVEMONSTER|"
            Case "WHITE SKELETON"
                enemyName = "|4083|WHITE SKELETON|"
            Case "YELLOW SKELETON"
                enemyName = "|4084|YELLOW SKELETON|"
            Case "BLACK SKELETON"
                enemyName = "|4085|BLACK SKELETON|"
            Case "WHITE SKELETON KNIGHT"
                enemyName = "|4086|WHITE SKELETON KNIGHT|"
            Case "YELLOW SKELETON KNIGHT"
                enemyName = "|4087|YELLOW SKELETON KNIGHT|"
            Case "BLACK SKELETON KNIGHT"
                enemyName = "|4088|BLACK SKELETON KNIGHT|"
            Case "WHITE SKELETON MAGE"
                enemyName = "|4089|WHITE SKELETON MAGE|"
            Case "YELLOW SKELETON MAGE"
                enemyName = "|4090|YELLOW SKELETON MAGE|"
            Case "BLACK SKELETON MAGE"
                enemyName = "|4091|BLACK SKELETON MAGE|"
            Case "GOBLIN SENTRY"
                enemyName = "|4092|GOBLIN SENTRY|"
            Case "GREEN SLIME"
                enemyName = "|4093|GREEN SLIME|"
            Case "BLUE SLIME"
                enemyName = "|4094|BLUE SLIME|"
            Case "ORANGE SLIME"
                enemyName = "|4095|ORANGE SLIME|"
            Case "ICE SLIME"
                enemyName = "|4096|ICE SLIME|"
            Case "FIRE SLIME"
                enemyName = "|4097|FIRE SLIME|"
            Case "SPIDER"
                enemyName = "|4098|SPIDER|"
            Case "TARMONSTER"
                enemyName = "|4099|TARMONSTER|"
            Case "TENTACLE"
                enemyName = "|4100|TENTACLE|"
            Case "CHEST MIMIC"
                enemyName = "|4101|CHEST MIMIC|"
            Case "LOCKED CHEST MIMIC"
                enemyName = "|4102|LOCKED CHEST MIMIC|"
            Case "WHITE CHEST MIMIC"
                enemyName = "|4103|WHITE CHEST MIMIC|"
            Case "FIRE CAULDRON MIMIC"
                enemyName = "|4104|FIRE CAULDRON MIMIC|"
            Case "ICE CAULDRON MIMIC"
                enemyName = "|4105|ICE CAULDRON MIMIC|"
            Case "WARLOCK"
                enemyName = "|4106|WARLOCK|"
            Case "NEON WARLOCK"
                enemyName = "|4107|NEON WARLOCK|"
            Case "WIGHT"
                enemyName = "|4108|WIGHT|"
            Case "WRAITH"
                enemyName = "|4109|WRAITH|"
            Case "YETI"
                enemyName = "|4110|YETI|"
            Case "ZOMBIE"
                enemyName = "|4111|ZOMBIE|"
            Case "CONGA LINE"
                enemyName = "|4112|CONGA LINE|"
            Case "SPIKETRAP"
                enemyName = "|4113|SPIKETRAP|"
            Case "BLOOD MAGIC"
                enemyName = "|4114|BLOOD MAGIC|"
            Case "BLOOD SHOVEL"
                enemyName = "|4115|BLOOD SHOVEL|"
            Case "BLOOD DRUM"
                enemyName = "|4116|BLOOD DRUM|"
            Case "BLOOD DEBT"
                enemyName = "|4117|BLOOD DEBT|"
            Case "BOOTS OF PAIN"
                enemyName = "|4118|BOOTS OF PAIN|"
            Case "CROWNOFTHORNS"
                enemyName = "|4119|CROWNOFTHORNS|"
            Case "COWARDICE"
                enemyName = "|4120|COWARDICE|"
            Case "VOW OF POVERTY"
                enemyName = "|4121|VOW OF POVERTY|"
            Case "HOTCOAL"
                enemyName = "|4122|HOTCOAL|"
            Case "LAVA"
                enemyName = "|4123|LAVA|"
            Case "DORIAN'S CURSE"
                enemyName = "|4124|DORIAN'S CURSE|"
            Case "SHOVE"
                enemyName = "|4125|SHOVE|"
            Case "CRYSTALTILE"
                enemyName = "|4126|CRYSTALTILE|"
            Case "SHRINE OF PACE"
                enemyName = "|4127|SHRINE OF PACE|"
            Case "SHRINE OF NO RETURN"
                enemyName = "|4128|SHRINE OF NO RETURN|"
            Case "SHRINE OF RISK"
                enemyName = "|4129|SHRINE OF RISK|"
            Case "TRAP WALLS"
                enemyName = "|4130|TRAP WALLS|"
            Case "BOMB"
                enemyName = "|4131|BOMB|"
            Case "MISSED BEAT"
                enemyName = "|4132|MISSED BEAT|"
            Case "MISSEDBEAT"
                enemyName = "|4132|MISSEDBEAT|"
            Case "GRAY SHOVEMONSTER"
                enemyName = "|4133|GRAY SHOVEMONSTER|"
            Case "DEEP BLUES"
                enemyName = "|4134|DEEP BLUES|"
            Case "FIREBALL"
                enemyName = "|4135|FIREBALL|"
            Case "RING OF PAIN"
                enemyName = "|11500|RING OF PAIN|"
            Case "GREEN GORGON STATUE"
                enemyName = "|11501|GREEN GORGON STATUE|"
            Case "GOLD GORGON STATUE"
                enemyName = "|11502|GOLD GORGON STATUE|"
            Case "RED DEVIL"
                enemyName = "|11503|RED DEVIL|"
            Case "GREEN DEVIL"
                enemyName = "|11504|GREEN DEVIL|"
            Case "PURPLE ELECTRIC MAGE"
                enemyName = "|11505|PURPLE ELECTRIC MAGE|"
            Case "RED ELECTRIC MAGE"
                enemyName = "|11506|RED ELECTRIC MAGE|"
            Case "GOLD ELECTRIC MAGE"
                enemyName = "|11507|GOLD ELECTRIC MAGE|"
            Case "GREEN EVIL EYE"
                enemyName = "|11508|GREEN EVIL EYE|"
            Case "PINK EVIL EYE"
                enemyName = "|11509|PINK EVIL EYE|"
            Case "SHOP WALL MIMIC"
                enemyName = "|11510|SHOP WALL MIMIC|"
            Case "FORTISSIMOLE"
                enemyName = "|11511|FORTISSIMOLE|"
            Case "GREEN GORGON"
                enemyName = "|11512|GREEN GORGON|"
            Case "GOLD GORGON"
                enemyName = "|11513|GOLD GORGON|"
            Case "GOLD METROGNOME"
                enemyName = "|11514|GOLD METROGNOME|"
            Case "GREEN METROGNOME"
                enemyName = "|11515|GREEN METROGNOME|"
            Case "GREEN ORC"
                enemyName = "|11516|GREEN ORC|"
            Case "PINK ORC"
                enemyName = "|11517|PINK ORC|"
            Case "PURPLE ORC"
                enemyName = "|11518|PURPLE ORC|"
            Case "PURPLE ELECTRIC ORB"
                enemyName = "|11519|PURPLE ELECTRIC ORB|"
            Case "RED ELECTRIC ORB"
                enemyName = "|11520|RED ELECTRIC ORB|"
            Case "GOLD ELECTRIC ORB"
                enemyName = "|11521|GOLD ELECTRIC ORB|"
            Case "WHITE SKULL"
                enemyName = "|11522|WHITE SKULL|"
            Case "YELLOW SKULL"
                enemyName = "|11523|YELLOW SKULL|"
            Case "BLACK SKULL"
                enemyName = "|11524|BLACK SKULL|"
            Case "PURPLE SLIME"
                enemyName = "|11525|PURPLE SLIME|"
            Case "CRATE MIMIC"
                enemyName = "|11526|CRATE MIMIC|"
        End Select

        Return enemyName
    End Function

    Function AddTagsToEnemyName_Size1_3: String(eName: String)
        Local enemyName: String

        Select eName
            Case "BARREL MIMIC"
                enemyName = "|11527|BARREL MIMIC|"
            Case "SHRINE MIMIC"
                enemyName = "|11528|SHRINE MIMIC|"
            Case "WATER BALL"
                enemyName = "|11529|WATER BALL|"
            Case "CURSED WRAITH"
                enemyName = "|11530|CURSED WRAITH|"
            Case "EARTH DRAGON"
                enemyName = "|11531|EARTH DRAGON|"
            Case "NO RETURN MODE"
                enemyName = "|11532|NO RETURN MODE|"
            Case "FRANKENSTEINWAY"
                enemyName = "|11533|FRANKENSTEINWAY|"
            Case "THE CONDUCTOR"
                enemyName = "|11534|THE CONDUCTOR|"
            Case "TEMPO'S CURSE"
                enemyName = "|11535|TEMPO'S CURSE|"
            Case "MARY'S CURSE"
                enemyName = "|11536|MARY'S CURSE|"
            Case "ELECTRIC ZOMBIE"
                enemyName = "|11537|ELECTRIC ZOMBIE|"
        End Select

        Return enemyName
    End Function

    Function AddTagsToEnemyName_SizeDefault: String(eName: String)
        Local enemyName: String

        enemyName = Enemy.AddTagsToEnemyName_SizeDefault_1(eName)
        If enemyName <> "" Then Return enemyName

        enemyName = Enemy.AddTagsToEnemyName_SizeDefault_2(eName)
        If enemyName <> "" Then Return enemyName

        enemyName = Enemy.AddTagsToEnemyName_SizeDefault_3(eName)
        If enemyName <> "" Then Return enemyName

        Return enemyName
    End Function

    Function AddTagsToEnemyName_SizeDefault_1: String(eName: String)
        Local enemyName: String

        Select eName
            Case "WHITE ARMADILLO"
                enemyName = "|6000|WHITE ARMADILLO|"
            Case "YELLOW ARMADILLO"
                enemyName = "|6001|YELLOW ARMADILLO|"
            Case "ORANGE ARMADILLO"
                enemyName = "|6002|ORANGE ARMADILLO|"
            Case "WHITE ARMORED SKELETON"
                enemyName = "|6003|WHITE ARMORED SKELETON|"
            Case "YELLOW ARMORED SKELETON"
                enemyName = "|6004|YELLOW ARMORED SKELETON|"
            Case "BLACK ARMORED SKELETON"
                enemyName = "|6005|BLACK ARMORED SKELETON|"
            Case "BLUE BANSHEE"
                enemyName = "|6006|BLUE BANSHEE|"
            Case "GREEN BANSHEE"
                enemyName = "|6007|GREEN BANSHEE|"
            Case "BLUE BAT"
                enemyName = "|6008|BLUE BAT|"
            Case "RED BAT"
                enemyName = "|6009|RED BAT|"
            Case "GREEN BAT"
                enemyName = "|6010|GREEN BAT|"
            Case "BLACK BAT"
                enemyName = "|6011|BLACK BAT|"
            Case "YELLOW DIREBAT"
                enemyName = "|6012|YELLOW DIREBAT|"
            Case "BROWN DIREBAT"
                enemyName = "|6013|BROWN DIREBAT|"
            Case "FIRE BEETLE"
                enemyName = "|6014|FIRE BEETLE|"
            Case "ICE BEETLE"
                enemyName = "|6015|ICE BEETLE|"
            Case "BISHOP"
                enemyName = "|6016|BISHOP|"
            Case "RED BISHOP"
                enemyName = "|6017|RED BISHOP|"
            Case "APPRENTICE BLADEMASTER"
                enemyName = "|6018|APPRENTICE BLADEMASTER|"
            Case "BLADEMASTER"
                enemyName = "|6019|BLADEMASTER|"
            Case "CLONE"
                enemyName = "|6020|CLONE|"
            Case "CORAL RIFF"
                enemyName = "|6021|CORAL RIFF|"
            Case "BARREL"
                enemyName = "|6022|BARREL|"
            Case "DEAD RINGER"
                enemyName = "|6023|DEAD RINGER|"
            Case "DEATH METAL"
                enemyName = "|6024|DEATH METAL|"
            Case "GREEN DRAGON"
                enemyName = "|6025|GREEN DRAGON|"
            Case "RED DRAGON"
                enemyName = "|6026|RED DRAGON|"
            Case "BLUE DRAGON"
                enemyName = "|6027|BLUE DRAGON|"
            Case "WALL MIMIC"
                enemyName = "|6028|WALL MIMIC|"
            Case "FIRE ELEMENTAL"
                enemyName = "|6029|FIRE ELEMENTAL|"
            Case "GARGOYLE"
                enemyName = "|6030|GARGOYLE|"
            Case "GHAST"
                enemyName = "|6031|GHAST|"
            Case "GHOST"
                enemyName = "|6032|GHOST|"
            Case "GHOUL"
                enemyName = "|6033|GHOUL|"
            Case "PURPLE GOBLIN"
                enemyName = "|6034|PURPLE GOBLIN|"
            Case "GRAY GOBLIN"
                enemyName = "|6035|GRAY GOBLIN|"
            Case "GOBLIN BOMBER"
                enemyName = "|6036|GOBLIN BOMBER|"
            Case "LIGHT GOLEM"
                enemyName = "|6037|LIGHT GOLEM|"
            Case "DARK GOLEM"
                enemyName = "|6038|DARK GOLEM|"
            Case "OOZE GOLEM"
                enemyName = "|6039|OOZE GOLEM|"
            Case "HARPY"
                enemyName = "|6040|HARPY|"
            Case "HELLHOUND"
                enemyName = "|6041|HELLHOUND|"
            Case "ICE ELEMENTAL"
                enemyName = "|6042|ICE ELEMENTAL|"
            Case "KING"
                enemyName = "|6043|KING|"
            Case "RED KING"
                enemyName = "|6044|RED KING|"
            Case "KING CONGA"
                enemyName = "|6045|KING CONGA|"
            Case "KNIGHT"
                enemyName = "|6046|KNIGHT|"
            Case "RED KNIGHT"
                enemyName = "|6047|RED KNIGHT|"
            Case "LEPRECHAUN"
                enemyName = "|6048|LEPRECHAUN|"
            Case "LICH"
                enemyName = "|6049|LICH|"
            Case "RED LICH"
                enemyName = "|6050|RED LICH|"
            Case "BLACK LICH"
                enemyName = "|6051|BLACK LICH|"
            Case "THE GOLDEN LUTE"
                enemyName = "|6052|THE GOLDEN LUTE|"
            Case "LIGHT MINOTAUR"
                enemyName = "|6053|LIGHT MINOTAUR|"
            Case "DARK MINOTAUR"
                enemyName = "|6054|DARK MINOTAUR|"
            Case "MOLE"
                enemyName = "|6055|MOLE|"
            Case "PURPLE MONKEY"
                enemyName = "|6056|PURPLE MONKEY|"
            Case "WHITE MONKEY"
                enemyName = "|6057|WHITE MONKEY|"
            Case "GREEN MONKEY"
                enemyName = "|6058|GREEN MONKEY|"
            Case "MAGIC MONKEY"
                enemyName = "|6059|MAGIC MONKEY|"
            Case "THE MOMMY"
                enemyName = "|6060|THE MOMMY|"
            Case "MUMMY"
                enemyName = "|6061|MUMMY|"
            Case "BLUE MUSHROOM"
                enemyName = "|6062|BLUE MUSHROOM|"
            Case "PURPLE MUSHROOM"
                enemyName = "|6063|PURPLE MUSHROOM|"
            Case "EXPLODING MUSHROOM"
                enemyName = "|6064|EXPLODING MUSHROOM|"
            Case "THE NECRODANCER"
                enemyName = "|6065|THE NECRODANCER|"
            Case "DARK NIGHTMARE"
                enemyName = "|6066|DARK NIGHTMARE|"
            Case "BLOOD NIGHTMARE"
                enemyName = "|6067|BLOOD NIGHTMARE|"
            Case "OGRE"
                enemyName = "|6068|OGRE|"
            Case "PAWN"
                enemyName = "|6069|PAWN|"
            Case "RED PAWN"
                enemyName = "|6070|RED PAWN|"
            Case "PIXIE"
                enemyName = "|6071|PIXIE|"
            Case "QUEEN"
                enemyName = "|6072|QUEEN|"
            Case "RED QUEEN"
                enemyName = "|6073|RED QUEEN|"
            Case "ROOK"
                enemyName = "|6074|ROOK|"
            Case "RED ROOK"
                enemyName = "|6075|RED ROOK|"
            Case "SARCOPHAGUS"
                enemyName = "|6076|SARCOPHAGUS|"
            Case "YELLOW SARCOPHAGUS"
                enemyName = "|6077|YELLOW SARCOPHAGUS|"
            Case "BLACK SARCOPHAGUS"
                enemyName = "|6078|BLACK SARCOPHAGUS|"
            Case "SHOPKEEPER"
                enemyName = "|6079|SHOPKEEPER|"
            Case "MONSTROUS SHOPKEEPER"
                enemyName = "|6080|MONSTROUS SHOPKEEPER|"
            Case "SHOPKEEPER GHOST"
                enemyName = "|6081|SHOPKEEPER GHOST|"
        End Select

        Return enemyName
    End Function

    Function AddTagsToEnemyName_SizeDefault_2: String(eName: String)
        Local enemyName: String

        Select eName
            Case "SHOVEMONSTER"
                enemyName = "|6082|SHOVEMONSTER|"
            Case "WHITE SKELETON"
                enemyName = "|6083|WHITE SKELETON|"
            Case "YELLOW SKELETON"
                enemyName = "|6084|YELLOW SKELETON|"
            Case "BLACK SKELETON"
                enemyName = "|6085|BLACK SKELETON|"
            Case "WHITE SKELETON KNIGHT"
                enemyName = "|6086|WHITE SKELETON KNIGHT|"
            Case "YELLOW SKELETON KNIGHT"
                enemyName = "|6087|YELLOW SKELETON KNIGHT|"
            Case "BLACK SKELETON KNIGHT"
                enemyName = "|6088|BLACK SKELETON KNIGHT|"
            Case "WHITE SKELETON MAGE"
                enemyName = "|6089|WHITE SKELETON MAGE|"
            Case "YELLOW SKELETON MAGE"
                enemyName = "|6090|YELLOW SKELETON MAGE|"
            Case "BLACK SKELETON MAGE"
                enemyName = "|6091|BLACK SKELETON MAGE|"
            Case "GOBLIN SENTRY"
                enemyName = "|6092|GOBLIN SENTRY|"
            Case "GREEN SLIME"
                enemyName = "|6093|GREEN SLIME|"
            Case "BLUE SLIME"
                enemyName = "|6094|BLUE SLIME|"
            Case "ORANGE SLIME"
                enemyName = "|6095|ORANGE SLIME|"
            Case "ICE SLIME"
                enemyName = "|6096|ICE SLIME|"
            Case "FIRE SLIME"
                enemyName = "|6097|FIRE SLIME|"
            Case "SPIDER"
                enemyName = "|6098|SPIDER|"
            Case "TARMONSTER"
                enemyName = "|6099|TARMONSTER|"
            Case "TENTACLE"
                enemyName = "|6100|TENTACLE|"
            Case "CHEST MIMIC"
                enemyName = "|6101|CHEST MIMIC|"
            Case "LOCKED CHEST MIMIC"
                enemyName = "|6102|LOCKED CHEST MIMIC|"
            Case "WHITE CHEST MIMIC"
                enemyName = "|6103|WHITE CHEST MIMIC|"
            Case "FIRE CAULDRON MIMIC"
                enemyName = "|6104|FIRE CAULDRON MIMIC|"
            Case "ICE CAULDRON MIMIC"
                enemyName = "|6105|ICE CAULDRON MIMIC|"
            Case "WARLOCK"
                enemyName = "|6106|WARLOCK|"
            Case "NEON WARLOCK"
                enemyName = "|6107|NEON WARLOCK|"
            Case "WIGHT"
                enemyName = "|6108|WIGHT|"
            Case "WRAITH"
                enemyName = "|6109|WRAITH|"
            Case "YETI"
                enemyName = "|6110|YETI|"
            Case "ZOMBIE"
                enemyName = "|6111|ZOMBIE|"
            Case "CONGA LINE"
                enemyName = "|6112|CONGA LINE|"
            Case "SPIKETRAP"
                enemyName = "|6113|SPIKETRAP|"
            Case "BLOOD MAGIC"
                enemyName = "|6114|BLOOD MAGIC|"
            Case "BLOOD SHOVEL"
                enemyName = "|6115|BLOOD SHOVEL|"
            Case "BLOOD DRUM"
                enemyName = "|6116|BLOOD DRUM|"
            Case "BLOOD DEBT"
                enemyName = "|6117|BLOOD DEBT|"
            Case "BOOTS OF PAIN"
                enemyName = "|6118|BOOTS OF PAIN|"
            Case "CROWNOFTHORNS"
                enemyName = "|6119|CROWNOFTHORNS|"
            Case "COWARDICE"
                enemyName = "|6120|COWARDICE|"
            Case "VOW OF POVERTY"
                enemyName = "|6121|VOW OF POVERTY|"
            Case "HOTCOAL"
                enemyName = "|6122|HOTCOAL|"
            Case "LAVA"
                enemyName = "|6123|LAVA|"
            Case "DORIAN'S CURSE"
                enemyName = "|6124|DORIAN'S CURSE|"
            Case "SHOVE"
                enemyName = "|6125|SHOVE|"
            Case "CRYSTALTILE"
                enemyName = "|6126|CRYSTALTILE|"
            Case "SHRINE OF PACE"
                enemyName = "|6127|SHRINE OF PACE|"
            Case "SHRINE OF NO RETURN"
                enemyName = "|6128|SHRINE OF NO RETURN|"
            Case "SHRINE OF RISK"
                enemyName = "|6129|SHRINE OF RISK|"
            Case "TRAP WALLS"
                enemyName = "|6130|TRAP WALLS|"
            Case "BOMB"
                enemyName = "|6131|BOMB|"
            Case "MISSED BEAT"
                enemyName = "|6132|MISSED BEAT|"
            Case "MISSEDBEAT"
                enemyName = "|6132|MISSEDBEAT|"
            Case "GRAY SHOVEMONSTER"
                enemyName = "|6133|GRAY SHOVEMONSTER|"
            Case "DEEP BLUES"
                enemyName = "|6134|DEEP BLUES|"
            Case "FIREBALL"
                enemyName = "|6135|FIREBALL|"
            Case "RING OF PAIN"
                enemyName = "|12500|RING OF PAIN|"
            Case "GREEN GORGON STATUE"
                enemyName = "|12501|GREEN GORGON STATUE|"
            Case "GOLD GORGON STATUE"
                enemyName = "|12502|GOLD GORGON STATUE|"
            Case "RED DEVIL"
                enemyName = "|12503|RED DEVIL|"
            Case "GREEN DEVIL"
                enemyName = "|12504|GREEN DEVIL|"
            Case "PURPLE ELECTRIC MAGE"
                enemyName = "|12505|PURPLE ELECTRIC MAGE|"
            Case "RED ELECTRIC MAGE"
                enemyName = "|12506|RED ELECTRIC MAGE|"
            Case "GOLD ELECTRIC MAGE"
                enemyName = "|12507|GOLD ELECTRIC MAGE|"
            Case "GREEN EVIL EYE"
                enemyName = "|12508|GREEN EVIL EYE|"
            Case "PINK EVIL EYE"
                enemyName = "|12509|PINK EVIL EYE|"
            Case "SHOP WALL MIMIC"
                enemyName = "|12510|SHOP WALL MIMIC|"
            Case "FORTISSIMOLE"
                enemyName = "|12511|FORTISSIMOLE|"
            Case "GREEN GORGON"
                enemyName = "|12512|GREEN GORGON|"
            Case "GOLD GORGON"
                enemyName = "|12513|GOLD GORGON|"
            Case "GOLD METROGNOME"
                enemyName = "|12514|GOLD METROGNOME|"
            Case "GREEN METROGNOME"
                enemyName = "|12515|GREEN METROGNOME|"
            Case "GREEN ORC"
                enemyName = "|12516|GREEN ORC|"
            Case "PINK ORC"
                enemyName = "|12517|PINK ORC|"
            Case "PURPLE ORC"
                enemyName = "|12518|PURPLE ORC|"
            Case "PURPLE ELECTRIC ORB"
                enemyName = "|12519|PURPLE ELECTRIC ORB|"
            Case "RED ELECTRIC ORB"
                enemyName = "|12520|RED ELECTRIC ORB|"
            Case "GOLD ELECTRIC ORB"
                enemyName = "|12521|GOLD ELECTRIC ORB|"
            Case "WHITE SKULL"
                enemyName = "|12522|WHITE SKULL|"
            Case "YELLOW SKULL"
                enemyName = "|12523|YELLOW SKULL|"
            Case "BLACK SKULL"
                enemyName = "|12524|BLACK SKULL|"
            Case "PURPLE SLIME"
                enemyName = "|12525|PURPLE SLIME|"
            Case "CRATE MIMIC"
                enemyName = "|12526|CRATE MIMIC|"
        End Select

        Return enemyName
    End Function

    Function AddTagsToEnemyName_SizeDefault_3: String(eName: String)
        Local enemyName: String

        Select eName
            Case "BARREL MIMIC"
                enemyName = "|12527|BARREL MIMIC|"
            Case "SHRINE MIMIC"
                enemyName = "|12528|SHRINE MIMIC|"
            Case "WATER BALL"
                enemyName = "|12529|WATER BALL|"
            Case "CURSED WRAITH"
                enemyName = "|12530|CURSED WRAITH|"
            Case "EARTH DRAGON"
                enemyName = "|12531|EARTH DRAGON|"
            Case "NO RETURN MODE"
                enemyName = "|12532|NO RETURN MODE|"
            Case "FRANKENSTEINWAY"
                enemyName = "|12533|FRANKENSTEINWAY|"
            Case "THE CONDUCTOR"
                enemyName = "|12534|THE CONDUCTOR|"
            Case "TEMPO'S CURSE"
                enemyName = "|12535|TEMPO'S CURSE|"
            Case "MARY'S CURSE"
                enemyName = "|12536|MARY'S CURSE|"
            Case "ELECTRIC ZOMBIE"
                enemyName = "|12537|ELECTRIC ZOMBIE|"
        End Select

        Return enemyName
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
        If Not Audio.IsFixedBeatSet()
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

    Function GetEnemyName: String(type: Int)
        Local enemyName := Enemy.GetEnemyNameHelper(type)

        Return Enemy.AddTagsToEnemyName(enemyName.ToUpper(), 2)
    End Function

    Function GetEnemyNameHelper: String(type: Int)
        Local enemyName: String

        ' NOTE: This function is split into multiple functions to work around an MSVC compiler limit (hard limit of 128 nesting levels).
        '       Monkey X transpiles `Select` statements into chained `else-if` clauses when targeting C++. This causes the deep nesting.
        enemyName = Enemy.GetEnemyNameHelper1(type)
        If enemyName <> "" Then Return enemyName

        enemyName = Enemy.GetEnemyNameHelper2(type)
        If enemyName <> "" Then Return enemyName

        Local enemiesNode := necrodancergame.xmlData.GetChildAtPath("enemies")
        Local enemyNodes := enemiesNode.GetChildrenWithAttributes("id=" + type)
        If Not enemyNodes.IsEmpty()
            Local enemyNode := enemyNodes.First()
            enemyName = enemyNode.GetAttribute("friendlyName", enemyNode.name)
        Else
            enemyName = "Unknown Enemy"
        End If

        Return enemyName
    End Function

    Function GetEnemyNameHelper1: String(type: Int)
        Local enemyName: String

        Select type
            Case EnemyType.GreenSlime
                enemyName = "Green Slime"
            Case EnemyType.OrangeSlime
                enemyName = "Orange Slime"
            Case EnemyType.WhiteSkeleton
                enemyName = "White Skeleton"
            Case EnemyType.YellowSkeleton
                enemyName = "Yellow Skeleton"
            Case EnemyType.BlackSkeleton
                enemyName = "Black Skeleton"
            Case EnemyType.BlueBat
                enemyName = "Blue Bat"
            Case EnemyType.RedBat
                enemyName = "Red Bat"
            Case EnemyType.GreenBat
                enemyName = "Green Bat"
            Case EnemyType.PurpleMonkey
                enemyName = "Purple Monkey"
            Case EnemyType.WhiteMonkey
                enemyName = "White Monkey"
            Case EnemyType.Ghost
                enemyName = "Ghost"
            Case EnemyType.Zombie
                enemyName = "Zombie"
            Case EnemyType.Wraith
                enemyName = "Wraith"
            Case EnemyType.ChestMimic
                enemyName = "Chest Mimic"
            Case EnemyType.LockedChestMimic
                enemyName = "Locked Chest Mimic"
            Case EnemyType.WhiteChestMimic
                enemyName = "White Chest Mimic"
            Case EnemyType.WhiteArmoredSkeleton
                enemyName = "White Armored Skeleton"
            Case EnemyType.YellowArmoredSkeleton
                enemyName = "Yellow Armored Skeleton"
            Case EnemyType.BlackArmoredSkeleton
                enemyName = "Black Armored Skeleton"
            Case EnemyType.WhiteSkeletonMage
                enemyName = "White Skeleton Mage"
            Case EnemyType.YellowSkeletonMage
                enemyName = "Yellow Skeleton Mage"
            Case EnemyType.BlackSkeletonMage
                enemyName = "Black Skeleton Mage"
            Case EnemyType.BlueMushroom
                enemyName = "Blue Mushroom"
            Case EnemyType.PurpleMushroom
                enemyName = "Purple Mushroom"
            Case EnemyType.LightGolem
                enemyName = "Light Golem"
            Case EnemyType.DarkGolem
                enemyName = "Dark Golem"
            Case EnemyType.WhiteArmadillo
                enemyName = "White Armadillo"
            Case EnemyType.YellowArmadillo
                enemyName = "Yellow Armadillo"
            Case EnemyType.Clone
                enemyName = "Clone"
            Case EnemyType.TarMonster
                enemyName = "Tarmonster"
            Case EnemyType.Mole
                enemyName = "Mole"
            Case EnemyType.Wight
                enemyName = "Wight"
            Case EnemyType.WallMimic
                enemyName = "Wall Mimic"
            Case EnemyType.MushroomLight,
                 EnemyType.ExplodingMushroom
                enemyName = "Mushroom Light"
            Case EnemyType.FireSlime
                enemyName = "Fire Slime"
            Case EnemyType.IceSlime
                enemyName = "Ice Slime"
            Case EnemyType.WhiteSkeletonKnight
                enemyName = "White Skeleton Knight"
            Case EnemyType.YellowSkeletonKnight
                enemyName = "Yellow Skeleton Knight"
            Case EnemyType.BlackSkeletonKnight
                enemyName = "Black Skeleton Knight"
            Case EnemyType.FireElemental
                enemyName = "Fire Elemental"
            Case EnemyType.IceElemental
                enemyName = "Ice Elemental"
            Case EnemyType.PurpleGoblin
                enemyName = "Purple Goblin"
            Case EnemyType.GrayGoblin
                enemyName = "Gray Goblin"
            Case EnemyType.FireBeetle
                enemyName = "Fire Beetle"
            Case EnemyType.IceBeetle
                enemyName = "Ice Beetle"
            Case EnemyType.Hellhound
                enemyName = "Hellhound"
            Case EnemyType.ShoveMonster
                enemyName = "Shovemonster"
            Case EnemyType.GrayShoveMonster
                enemyName = "Gray Shovemonster"
            Case EnemyType.Yeti
                enemyName = "Yeti"
            Case EnemyType.Ghast
                enemyName = "Ghast"
            Case EnemyType.FireCauldronMimic
                enemyName = "Fire Cauldron Mimic"
            Case EnemyType.IceCauldronMimic
                enemyName = "Ice Cauldron Mimic"
            Case EnemyType.FireCauldron,
                 EnemyType.IceCauldron
                enemyName = "Cauldron"
            Case EnemyType.GoblinBomber
                enemyName = "Goblin Bomber"
            Case EnemyType.GoblinSentry
                enemyName = "Goblin Sentry"
            Case EnemyType.BlackBat
                enemyName = "Black Bat"
            Case EnemyType.OrangeArmadillo
                enemyName = "Orange Armadillo"
            Case EnemyType.ApprenticeBlademaster
                enemyName = "Apprentice Blademaster"
            Case EnemyType.Blademaster
                enemyName = "Blademaster"
            Case EnemyType.Ghoul
                enemyName = "Ghoul"
            Case EnemyType.OozeGolem
                enemyName = "Ooze Golem"
            Case EnemyType.Harpy
                enemyName = "Harpy"
            Case EnemyType.Lich
                enemyName = "Lich"
            Case EnemyType.RedLich
                enemyName = "Red Lich"
            Case EnemyType.BlackLich
                enemyName = "Black Lich"
            Case EnemyType.GreenMonkey
                enemyName = "Green Monkey"
            Case EnemyType.MagicMonkey
                enemyName = "Magic Monkey"
            Case EnemyType.Pixie
                enemyName = "Pixie"
            Case EnemyType.Sarcophagus
                enemyName = "Sarcophagus"
            Case EnemyType.YellowSarcophagus
                enemyName = "Yellow Sarcophagus"
            Case EnemyType.BlackSarcophagus
                enemyName = "Black Sarcophagus"
            Case EnemyType.Spider
                enemyName = "Spider"
            Case EnemyType.Warlock
                enemyName = "Warlock"
            Case EnemyType.NeonWarlock
                enemyName = "Neon Warlock"
            Case EnemyType.YellowDireBat
                enemyName = "Yellow Direbat"
            Case EnemyType.BrownDireBat
                enemyName = "Brown Direbat"
            Case EnemyType.GreenDragon
                enemyName = "Green Dragon"
            Case EnemyType.RedDragon
                enemyName = "Red Dragon"
            Case EnemyType.BlueDragon
                enemyName = "Blue Dragon"
            Case EnemyType.BlueBanshee
                enemyName = "Blue Banshee"
            Case EnemyType.GreenBanshee
                enemyName = "Green Banshee"
            Case EnemyType.LightMinotaur
                enemyName = "Light Minotaur"
        End Select

        Return enemyName
    End Function

    Function GetEnemyNameHelper2: String(type: Int)
        Local enemyName: String

        Select type
            Case EnemyType.DarkMinotaur
                enemyName = "Dark Minotaur"
            Case EnemyType.DarkNightmare
                enemyName = "Dark Nightmare"
            Case EnemyType.BloodNightmare
                enemyName = "Blood Nightmare"
            Case EnemyType.TheMommy
                enemyName = "The Mommy"
            Case EnemyType.Ogre
                enemyName = "Ogre"
            Case EnemyType.KingConga
                enemyName = "King Conga"
            Case EnemyType.DeathMetal
                enemyName = "Death Metal"
            Case EnemyType.DeepBlues
                enemyName = "Deep Blues"
            Case EnemyType.CoralRiff
                enemyName = "Coral Riff"
            Case EnemyType.Fortissimole
                enemyName = "Fortissimole"
            Case EnemyType.DeadRinger
                enemyName = "Dead Ringer"
            Case EnemyType.TheNecroDancer,
                 EnemyType.TheNecroDancer2
                enemyName = "The Necrodancer"
            Case EnemyType.TheGoldenLute
                enemyName = "The Golden Lute"
            Case EnemyType.Frankensteinway
                enemyName = "Frankensteinway"
            Case EnemyType.TheConductor
                enemyName = "The Conductor"
            Case EnemyType.Shopkeeper1,
                 EnemyType.Shopkeeper2,
                 EnemyType.Shopkeeper3,
                 EnemyType.Shopkeeper4
                enemyName = "Shopkeeper"
        End Select

        Return enemyName
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
        Local numStairLockingMinibosses := 0

        For Local enemy := EachIn Enemy.enemyList
            If enemy.isStairLockingMiniboss
                numStairLockingMinibosses += 1
            End If
        End For

        Return numStairLockingMinibosses
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

    Function LoadBestiarySprite: Sprite(type: Int)
        Local sprite: Sprite

        ' NOTE: This function is split into multiple functions to work around an MSVC compiler limit (hard limit of 128 nesting levels).
        '       Monkey X transpiles `Select` statements into chained `else-if` clauses when targeting C++. This causes the deep nesting.
        sprite = Enemy.LoadBestiarySprite1(type)
        If sprite <> Null Then Return sprite

        sprite = Enemy.LoadBestiarySprite2(type)
        If sprite <> Null Then Return sprite

        Return sprite
    End Function

    Function LoadBestiarySprite1: Sprite(type: Int)
        Local sprite: Sprite

        Select type
            Case EnemyType.GreenSlime
                sprite = New Sprite("bestiary_greenslime.png", 1)
            Case EnemyType.BlueSlime
                sprite = New Sprite("bestiary/bestiary_blueslime.png", 1)
            Case EnemyType.OrangeSlime
                sprite = New Sprite("bestiary/bestiary_orangeslime.png", 1)
            Case EnemyType.WhiteSkeleton
                sprite = New Sprite("bestiary/bestiary_skeleton.png", 1)
            Case EnemyType.YellowSkeleton
                sprite = New Sprite("bestiary/bestiary_yellowskeleton.png", 1)
            Case EnemyType.BlackSkeleton
                sprite = New Sprite("bestiary/bestiary_blackskeleton.png", 1)
            Case EnemyType.BlueBat
                sprite = New Sprite("bestiary/bestiary_bluebat.png", 1)
            Case EnemyType.RedBat
                sprite = New Sprite("bestiary/bestiary_redbat.png", 1)
            Case EnemyType.GreenBat
                sprite = New Sprite("bestiary/bestiary_greenbat.png", 1)
            Case EnemyType.PurpleMonkey
                sprite = New Sprite("bestiary/bestiary_purplemonkey.png", 1)
            Case EnemyType.WhiteMonkey
                sprite = New Sprite("bestiary/bestiary_whitemonkey.png", 1)
            Case EnemyType.Ghost
                sprite = New Sprite("bestiary/bestiary_ghost.png", 1)
            Case EnemyType.Zombie
                sprite = New Sprite("bestiary/bestiary_zombie.png", 1)
            Case EnemyType.Wraith
                sprite = New Sprite("bestiary/bestiary_wraith.png", 1)
            Case EnemyType.ChestMimic
                sprite = New Sprite("bestiary/bestiary_trapchest.png", 1)
            Case EnemyType.LockedChestMimic
                sprite = New Sprite("bestiary/bestiary_trapchest.png", 1)
            Case EnemyType.WhiteChestMimic
                sprite = New Sprite("bestiary/bestiary_trapchest.png", 1)
            Case EnemyType.WhiteArmoredSkeleton
                sprite = New Sprite("bestiary/bestiary_armoredskeleton.png", 1)
            Case EnemyType.YellowArmoredSkeleton
                sprite = New Sprite("bestiary/bestiary_yellowarmoredskeleton.png", 1)
            Case EnemyType.BlackArmoredSkeleton
                sprite = New Sprite("bestiary/bestiary_blackarmoredskeleton.png", 1)
            Case EnemyType.WhiteSkeletonMage
                sprite = New Sprite("bestiary/bestiary_skeletonmage.png", 1)
            Case EnemyType.YellowSkeletonMage
                sprite = New Sprite("bestiary/bestiary_yellowskeletonmage.png", 1)
            Case EnemyType.BlackSkeletonMage
                sprite = New Sprite("bestiary/bestiary_blackskeletonmage.png", 1)
            Case EnemyType.BlueMushroom
                sprite = New Sprite("bestiary/bestiary_mushroom.png", 1)
            Case EnemyType.PurpleMushroom
                sprite = New Sprite("bestiary/bestiary_purplemushroom.png", 1)
            Case EnemyType.LightGolem
                sprite = New Sprite("bestiary/bestiary_dirtgolem.png", 1)
            Case EnemyType.DarkGolem
                sprite = New Sprite("bestiary/bestiary_darkgolem.png", 1)
            Case EnemyType.WhiteArmadillo
                sprite = New Sprite("bestiary/bestiary_whitearmadillo.png", 1)
            Case EnemyType.YellowArmadillo
                sprite = New Sprite("bestiary/bestiary_yellowarmadillo.png", 1)
            Case EnemyType.Clone
                sprite = New Sprite("bestiary/bestiary_clone.png", 1)
            Case EnemyType.TarMonster
                sprite = New Sprite("bestiary/bestiary_tarmonster.png", 1)
            Case EnemyType.Mole
                sprite = New Sprite("bestiary/bestiary_mole.png", 1)
            Case EnemyType.Wight
                sprite = New Sprite("bestiary/bestiary_wight.png", 1)
            Case EnemyType.WallMimic
                sprite = New Sprite("bestiary/bestiary_fakewall.png", 1)
            Case EnemyType.FireSlime
                sprite = New Sprite("bestiary/bestiary_fireslime.png", 1)
            Case EnemyType.IceSlime
                sprite = New Sprite("bestiary/bestiary_iceslime.png", 1)
            Case EnemyType.WhiteSkeletonKnight
                sprite = New Sprite("bestiary/bestiary_skeletonknight.png", 1)
            Case EnemyType.YellowSkeletonKnight
                sprite = New Sprite("bestiary/bestiary_yellowskeletonknight.png", 1)
            Case EnemyType.BlackSkeletonKnight
                sprite = New Sprite("bestiary/bestiary_blackskeletonknight.png", 1)
            Case EnemyType.FireElemental
                sprite = New Sprite("bestiary/bestiary_fireelemental.png", 1)
            Case EnemyType.IceElemental
                sprite = New Sprite("bestiary/bestiary_iceelemental.png", 1)
            Case EnemyType.PurpleGoblin
                sprite = New Sprite("bestiary/bestiary_goblin.png", 1)
            Case EnemyType.GrayGoblin
                sprite = New Sprite("bestiary/bestiary_greygoblin.png", 1)
            Case EnemyType.FireBeetle
                sprite = New Sprite("bestiary/bestiary_firebeetle.png", 1)
            Case EnemyType.IceBeetle
                sprite = New Sprite("bestiary/bestiary_icebeetle.png", 1)
            Case EnemyType.Hellhound
                sprite = New Sprite("bestiary/bestiary_hellhound.png", 1)
            Case EnemyType.ShoveMonster
                sprite = New Sprite("bestiary/bestiary_shovemonster.png", 1)
            Case EnemyType.GrayShoveMonster
                sprite = New Sprite("bestiary/bestiary_greyshovemonster.png", 1)
            Case EnemyType.Yeti
                sprite = New Sprite("bestiary/bestiary_yeti.png", 1)
            Case EnemyType.Ghast
                sprite = New Sprite("bestiary/bestiary_ghast.png", 1)
            Case EnemyType.FireCauldronMimic
                sprite = New Sprite("bestiary/bestiary_trapcauldron.png", 1)
            Case EnemyType.IceCauldronMimic
                sprite = New Sprite("bestiary/bestiary_trapcauldron.png", 1)
            Case EnemyType.GoblinBomber
                sprite = New Sprite("bestiary/bestiary_goblinbomber.png", 1)
            Case EnemyType.GoblinSentry
                sprite = New Sprite("bestiary/bestiary_goblinsentry.png", 1)
            Case EnemyType.BlackBat
                sprite = New Sprite("bestiary/bestiary_blackbat.png", 1)
            Case EnemyType.OrangeArmadillo
                sprite = New Sprite("bestiary/bestiary_orangearmadillo.png", 1)
            Case EnemyType.ApprenticeBlademaster
                sprite = New Sprite("bestiary/bestiary_blademaster.png", 1)
            Case EnemyType.Blademaster
                sprite = New Sprite("bestiary/bestiary_orangeblademaster.png", 1)
            Case EnemyType.Ghoul
                sprite = New Sprite("bestiary/bestiary_ghoul.png", 1)
            Case EnemyType.OozeGolem
                sprite = New Sprite("bestiary/bestiary_oozegolem.png", 1)
            Case EnemyType.Harpy
                sprite = New Sprite("bestiary/bestiary_harpy.png", 1)
            Case EnemyType.Lich
                sprite = New Sprite("bestiary/bestiary_lich.png", 1)
            Case EnemyType.RedLich
                sprite = New Sprite("bestiary/bestiary_redlich.png", 1)
            Case EnemyType.BlackLich
                sprite = New Sprite("bestiary/bestiary_blacklich.png", 1)
            Case EnemyType.GreenMonkey
                sprite = New Sprite("bestiary/bestiary_greenmonkey.png", 1)
            Case EnemyType.MagicMonkey
                sprite = New Sprite("bestiary/bestiary_magicmonkey.png", 1)
            Case EnemyType.Pixie
                sprite = New Sprite("bestiary/bestiary_pixie.png", 1)
            Case EnemyType.Sarcophagus
                sprite = New Sprite("bestiary/bestiary_sarcophagus.png", 1)
            Case EnemyType.YellowSarcophagus
                sprite = New Sprite("bestiary/bestiary_yellowsarcophagus.png", 1)
            Case EnemyType.BlackSarcophagus
                sprite = New Sprite("bestiary/bestiary_blacksarcophagus.png", 1)
            Case EnemyType.Spider
                sprite = New Sprite("bestiary/bestiary_spider.png", 1)
            Case EnemyType.Warlock
                sprite = New Sprite("bestiary/bestiary_warlock.png", 1)
            Case EnemyType.WhiteSkull
                sprite = New Sprite("bestiary/bestiary_skull.png", 1)
            Case EnemyType.YellowSkull
                sprite = New Sprite("bestiary/bestiary_yellowskull.png", 1)
            Case EnemyType.BlackSkull
                sprite = New Sprite("bestiary/bestiary_blackskull.png", 1)
            Case EnemyType.WaterBall
                sprite = New Sprite("bestiary/bestiary_waterball.png", 1)
            Case EnemyType.PurpleElectricMage
                sprite = New Sprite("bestiary/bestiary_electricmage.png", 1)
            Case EnemyType.RedElectricMage
                sprite = New Sprite("bestiary/bestiary_redelectricmage.png", 1)
            Case EnemyType.GoldElectricMage
                sprite = New Sprite("bestiary/bestiary_goldelectricmage.png", 1)
            Case EnemyType.ElectricZombie
                sprite = New Sprite("bestiary/bestiary_electriczombie.png", 1)
            Case EnemyType.GreenEvilEye
                sprite = New Sprite("bestiary/bestiary_evileye.png", 1)
            Case EnemyType.PinkEvilEye
                sprite = New Sprite("bestiary/bestiary_pinkevileye.png", 1)
        End Select

        Return sprite
    End Function

    Function LoadBestiarySprite2: Sprite(type: Int)
        Local sprite: Sprite

        Select type
            Case EnemyType.GreenGorgon
                sprite = New Sprite("bestiary/bestiary_gorgon.png", 1)
            Case EnemyType.GoldGorgon
                sprite = New Sprite("bestiary/bestiary_goldgorgon.png", 1)
            Case EnemyType.GreenOrc
                sprite = New Sprite("bestiary/bestiary_orc.png", 1)
            Case EnemyType.PinkOrc
                sprite = New Sprite("bestiary/bestiary_pinkorc.png", 1)
            Case EnemyType.PurpleOrc
                sprite = New Sprite("bestiary/bestiary_purpleorc.png", 1)
            Case EnemyType.RedDevil
                sprite = New Sprite("bestiary/bestiary_devil.png", 1)
            Case EnemyType.GreenDevil
                sprite = New Sprite("bestiary/bestiary_greendevil.png", 1)
            Case EnemyType.PurpleSlime
                sprite = New Sprite("bestiary/bestiary_purpleslime.png", 1)
            Case EnemyType.CursedWraith
                sprite = New Sprite("bestiary/bestiary_cursedwraith.png", 1)
            Case EnemyType.CrateMimic
                sprite = New Sprite("bestiary/bestiary_cratemimic.png", 1)
            Case EnemyType.ShopWallMimic
                sprite = New Sprite("bestiary/bestiary_shopwall.png", 1)
            Case EnemyType.BarrelMimic
                sprite = New Sprite("bestiary/bestiary_barrelmimic.png", 1)
            Case EnemyType.ShrineMimic
                sprite = New Sprite("bestiary/bestiary_shrinemimic.png", 1)
            Case EnemyType.NeonWarlock
                sprite = New Sprite("bestiary/bestiary_neonwarlock.png", 1)
            Case EnemyType.YellowDireBat
                sprite = New Sprite("bestiary/bestiary_direbat.png", 1)
            Case EnemyType.BrownDireBat
                sprite = New Sprite("bestiary/bestiary_greydirebat.png", 1)
            Case EnemyType.GreenDragon
                sprite = New Sprite("bestiary/bestiary_greendragon.png", 1)
            Case EnemyType.RedDragon
                sprite = New Sprite("bestiary/bestiary_reddragon.png", 1)
            Case EnemyType.BlueDragon
                sprite = New Sprite("bestiary/bestiary_bluedragon.png", 1)
            Case EnemyType.EarthDragon
                sprite = New Sprite("bestiary/bestiary_earthdragon.png", 1)
            Case EnemyType.BlueBanshee
                sprite = New Sprite("bestiary/bestiary_banshee.png", 1)
            Case EnemyType.GreenBanshee
                sprite = New Sprite("bestiary/bestiary_greenbanshee.png", 1)
            Case EnemyType.LightMinotaur
                sprite = New Sprite("bestiary/bestiary_minotaur.png", 1)
            Case EnemyType.DarkMinotaur
                sprite = New Sprite("bestiary/bestiary_greyminotaur.png", 1)
            Case EnemyType.DarkNightmare
                sprite = New Sprite("bestiary/bestiary_nightmare.png", 1)
            Case EnemyType.BloodNightmare
                sprite = New Sprite("bestiary/bestiary_bloodnightmare.png", 1)
            Case EnemyType.TheMommy
                sprite = New Sprite("bestiary/bestiary_mommy.png", 1)
            Case EnemyType.Ogre
                sprite = New Sprite("bestiary/bestiary_ogre.png", 1)
            Case EnemyType.GoldMetroGnome
                sprite = New Sprite("bestiary/bestiary_metrognome.png", 1)
            Case EnemyType.GreenMetroGnome
                sprite = New Sprite("bestiary/bestiary_greenmetrognome.png", 1)
        End Select

        Return sprite
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
        Enemy.enemiesFearfulDuration -= 1

        If Player.AllPlayersPerished() Or
           controller_game.players[controller_game.player1].falling Or
           Level.isLevelEditor
            Return
        End If

        Local anyPlayerHasMoved := True
        If controller_game.currentLevel = LevelType.BossBattle
            anyPlayerHasMoved = False
            For Local i := 0 Until controller_game.numPlayers
                If Not Chain.waitingForFirstMovement[i]
                    anyPlayerHasMoved = True

                    Exit
                End If
            End For
        End If

        For Local enemy := EachIn Enemy.enemyList
            If Enemy.enemiesPaused And
               (Not anyPlayerHasMoved Or Not enemy.exemptFromPause)
                Continue
            End If

            enemy.movedThisFrame = False
            enemy.attemptedMoveThisFrame = False
            enemy.changedTilePositionThisFrame = False
            enemy.frozenDuration = math.Max(0, enemy.frozenDuration)
        End For

        Enemy.enemyList.Sort()

        Local moveSucceeded: Bool
        Repeat
            moveSucceeded = False

            For Local enemy := EachIn Enemy.enemyList
                If Enemy.enemiesPaused And
                   (Not anyPlayerHasMoved Or Not enemy.exemptFromPause)
                    Continue
                End If

                If enemy.movedThisFrame Or
                   enemy.flaggedForDeath Or
                   enemy.charmed Or
                   enemy.IsFrozen(False) Or
                   enemy.deAggroed
                    Continue
                End If

                If Player.AnyPlayerInSpecialRoom() And
                   Not enemy.inArena And
                   NPC(enemy) = Null And
                   Not enemy.isUnaffectedByArenas
                    Continue
                End If

                If Not enemy.hasBeenVisible And
                   Util.GetDistFromClosestPlayer(enemy.x, enemy.y, False) > enemy.minEnemyMoveDistance And
                   Not enemy.movesRegardlessOfDistance
                    Continue
                End If

                If enemy.dontMove
                    Continue
                End If

                enemy.attemptedMoveThisFrame = True
                Select enemy.Move()
                    Case 1
                        moveSucceeded = True
                        enemy.MoveSucceed(False, False)
                        enemy.movedThisFrame = True
                    Case 2
                        moveSucceeded = True
                        enemy.MoveSucceed(True, False)
                        enemy.movedThisFrame = True
                    Case 3
                        moveSucceeded = True
                        enemy.MoveSucceed(False, True)
                        enemy.movedThisFrame = True
                End Select
            End For
        Until Not moveSucceeded

        For Local enemy := EachIn Enemy.enemyList
            If enemy.attemptedMoveThisFrame And
               Not enemy.movedThisFrame
                enemy.MoveFail()
            End If
        End For
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
        If necrodancergame.DEBUG_STOP_ENEMY_MOVEMENT Or
           controller_game.showScoreMessage Or
           controller_game.hasWon
            Self.currentMoveDelay = 2
        Else If Self.ignoreWalls Or
                Self.justHitPlayer Or
                Self.seekingPlayer = Null Or
                Not Self.seekingPlayer.IsPhasing Or
                Not Level.IsWallAt(Self.seekingPlayer.x, Self.seekingPlayer.y)
            Self.currentMoveDelay -= 1
            If Self.currentMoveDelay <= 0
                Self.currentMoveDelay = Self.beatsPerMove
            End If
        End If
    End Method

    Method AfterHitHook: Void(diffX: Int, diffY: Int)
        ' Empty implementation
    End Method

    Method AnimateToTheBeat: Void()
        If Self.animOverrideState <> -1
            Self.image.SetFrame(Self.animOverrideState)
        End If

        If Self.wasFrozen And
           Self.IsFrozen(True)
            Local frame := Self.image.GetFrame()
            Local numFrames := Self.image.GetNumFrames()
            If frame >= (numFrames / 2)
                frame = Self.image.GetFrame()
                numFrames = Self.image.GetNumFrames()
                Self.image.SetFrame(frame - (numFrames / 2))
            End If

            Return
        End If

        Self.blinkDelay -= 1
        Self.blinkDuration -= 1
        If Self.blinkDelay <= 0
            Self.blinkDelay = Util.RndIntRange(Self.blink_MIN, Self.blink_MAX, False)
            Self.blinkDuration = Self.blink_DUR
        End If

        If Self.animOverride <> -1
            Local animOverride := Self.animOverride
            If Self.animOverrideState <> -1
                animOverride += Self.animOverrideState
            End If

            Self.image.SetFrame(animOverride)

            Return
        End If

        If Self.animNormal.IsEmpty()
            Return
        End If

        Self.image.SetFrame(Self.animOffset)

        Local useAnimNormal2 := False
        If Not Self.animNormal2.IsEmpty()
            useAnimNormal2 = (Self.GetBeatNum() Mod 2 = 0)
        End If

        Select Self.overrideNormal2Timing
            Case 0
                useAnimNormal2 = False
            Case 1
                useAnimNormal2 = True
        End Select

        Local useAnimNormal3 := False
        If Not Self.animNormal3.IsEmpty()
            useAnimNormal3 = (Self.GetBeatNum() Mod 3 = 2)
            useAnimNormal2 = (Self.GetBeatNum() Mod 3 = 1)
        End If

        Local useAnimTellBlink := False
        Local useAnimTell := False
        If Self.overrideTellTiming <> 0 And
           (Self.overrideTellTiming = 1 Or
            Self.currentMoveDelay <= 1)
            useAnimTellBlink = True
            useAnimTell = False
            If Self.animTell.Contains(0)
                Local animTell0 := Self.animTell.Get(0)
                If animTell0.onFraction <> 1.0
                    useAnimTellBlink = True
                    useAnimTell = True
                End If
            End If
        End If

        Local i := 0
        Local animData: BeatAnimationData
        Repeat
            animData = Self.animNormal.Get(i)

            If useAnimNormal2
                animData = Self.animNormal2.Get(i)
            End If

            If useAnimNormal3
                animData = Self.animNormal3.Get(i)
            End If

            If useAnimTell
                animData = Self.animTell.Get(i)
            End If

            If Self.IsBetweenFraction(animData.onFraction, animData.offFraction) Or
               animData.singleFrame
                Exit
            End If

            i += 1

            If Not useAnimTell And
               Not Self.animNormal.Contains(i)
                TextLog.Message("WARNING, AnimateToTheBeat: Attempted to animate a frame that doesn't exist!  Frame: " + animData.frame + " Sprite filename: " + Self.image.path)

                Return
            End If
        Forever

        If Self.enableTell
            If Self.animTellBlink.Contains(i) And
               useAnimTellBlink And
               Self.blinkDuration > 0
                animData = Self.animTellBlink.Get(i)
            Else If Self.enableTell And
                    Self.animTell.Contains(i) And
                    useAnimTellBlink
                If Not useAnimTell
                    animData = Self.animTell.Get(i)
                End If
            Else If Self.animBlink.Contains(i) And
                    Self.blinkDuration > 0
                animData = Self.animBlink.Get(i)
            End If
        Else If Self.animBlink.Contains(i) And
                Self.blinkDuration > 0
            animData = Self.animBlink.Get(i)
        End If

        Self.image.SetFrame(animData.frame + Self.animOffset)
    End Method

    Method ApplyMonkeyPaw: Void()
        If Self.isMonkeyLike
            If Player.DoesAnyPlayerHaveItemOfType("misc_monkey_paw")
                Self.frozenPermanently = True
            End If
        End If
    End Method

    Method AttemptMove: Int(xVal: Int, yVal: Int)
        If Self.IsConfused()
            xVal = -xVal
            yVal = -yVal
        End If

        Self.lastAttemptedMove.x = xVal
        Self.lastAttemptedMove.y = yVal

        Local nextX := Self.x + xVal
        Local nextY := Self.y + yVal

        Local enemy := Enemy.GetEnemyAt(nextX, nextY, True)
        If enemy <> Null And
           enemy.collides And
           enemy <> Self And
           Not Self.tramples And
           Not Util.IsAnyPlayerAt(nextX, nextY)
            Return 4
        End If

        Return Self.MoveImmediate(xVal, yVal, "self")
    End Method

    Method BasicFlee: Point(includeDiagonals: Bool)
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
        If FamiliarFixed.debugTouchDamage
            Local familiarFixed := FamiliarFixed.GetFamiliarAt(Self.x, Self.y)
            If familiarFixed <> Null
                familiarFixed.ApplyEffect(Direction.None)
            End If
        End If
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
        Audio.includeVideoLatency = True
        Local beatNum := Audio.GetCurrentBeatNumberIncludingLoops(0, False)
        Audio.includeVideoLatency = False

        Return beatNum
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

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Enemy.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method ImageFlipX: Void(flipX: Bool)
        Debug.TraceNotImplemented("Enemy.ImageFlipX(Bool)")
    End Method

    Method ImmuneToFear: Bool()
        Return False
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
            Self.frozenImage = New Sprite("entities/frozen_feet_large.png", 31, 24, 2)
        Else
            Self.frozenImage = New Sprite("entities/frozen_feet_medium.png", 31, 24, 2)
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
        If Not Self.floating And
           Self.IsVisible()
            Self.jumpDirtTimer = 0
            Self.jumpDirtX = xVal
            Self.jumpDirtY = yVal
        End If
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
        Local relativeVideoTimeUntilBeat := Self.RelativeVideoTimeUntilBeat()

        Return relativeVideoTimeUntilBeat >= on And
               (on <= off And off > relativeVideoTimeUntilBeat) Or
               (on > off And off <= relativeVideoTimeUntilBeat)
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
        If Self.flaggedForDeath
            Return 0
        End If

        If Self.currentMoveDelay > 1 And
           (Enemy.enemiesFearfulDuration <= 0 Or Self.isCrate)
            Return 3
        End If

        Local movementDirection: Point
        If Enemy.enemiesFearfulDuration > 0 And
           Not Self.isCrate And
           Not Self.ImmuneToFear()
            movementDirection = Self.BasicFlee(False)
        Else
            movementDirection = Self.GetMovementDirection()
        End If

        If movementDirection.x = 0 And
           movementDirection.y = 0
            Return 3
        End If

        Return Self.AttemptMove(movementDirection.x, movementDirection.y)
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("Enemy.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        If Self.flaggedForDeath
            Return 0
        End If

        Local trap := Trap.GetTrapAt(Self.x, Self.y)
        If trap <> Null
            If trap.willTriggerOn = Self
                trap.Trigger(Self)
            End If
        End If

        Self.lastX = Self.x
        Self.lastY = Self.y

        If Self.IsStuckInLiquid()
            Return 0
        End If

        Local nextX := Self.x + xVal
        Local nextY := Self.y + yVal

        Local moveResult := Self.PerformMovement(nextX, nextY)
        Select moveResult
            Case 0
                If Self.bounceOnMovementFail
                    Local bounceTo := New Point(xVal, yVal)
                    Local bufferTween := movementSource = "bounceTrap"
                    Self.BounceToward(bounceTo, bufferTween)
                End If
            Case 2
                Self.PerformTween(nextX, nextY, Self.lastX, Self.lastY, Self.hitTween, Self.hitShadowTween, False)

                If Not Self.isGentle
                    Self.renderSwipeTime = 10
                End If

                Self.attackSwipeDir = Util.GetDirFromDiff(xVal, yVal)
                Self.attackSwipePoint = New Point(xVal, yVal)
                Self.AfterHitHook(xVal, yVal)
                Self.InitDirtJump(Self.lastX, Self.lastY)
            Default
                Local bufferTween := movementSource = "bounceTrap"
                Self.PerformTween(Self.x, Self.y, Self.lastX, Self.lastY, Self.moveTween, Self.moveShadowTween, bufferTween)

                Self.gotOutOfTar = False

                If Self.overrideMoveSound <> ""
                    Audio.PlayGameSoundAt(Self.overrideMoveSound, Self.x, Self.y, False, -1, False)
                End If

                If Level.GetTileTypeAt(Self.x, Self.y) = TileType.Lava And
                   Not Self.floating
                    Self.Hit("LAVA", 999)
                End If

                Local dir := Util.GetDirFromDiff(xVal, yVal)
                Self.CheckFamiliarTouch(dir)
                Self.InitDirtJump(Self.lastX, Self.lastY)
                Self.changedTilePositionThisFrame = True

                moveResult = 1
        End Select

        Return moveResult
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Self.useLastPosForSwipe = False
        Self.justHitPlayer = hitPlayer

        Self.AdvanceMovementDelay()
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
        If Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.executedCry And
           Not Level.isLevelEditor
            Self.executedCry = True

            If Self.overrideCrySound <> ""
                Audio.PlayGameSoundAt(Self.overrideCrySound, Self.x, Self.y, True, -1, False)
            End If
        End If

        If Self.isDancer And
           Not Level.IsWallAt(Self.x, Self.y)
            Self.shadowYOff += 8
            Self.isDancer = False
            Self.yOff += 8.0
            Self.image.SetZOff(Self.image.zOff - 124.0)
            Self.shadow.SetZOff(0.0)
            Self.shadow.SetZ(-990.0)
            Self.currentMoveDelay = 2
        End If

        Self.AnimateToTheBeat()

        Super.Update()

        Self.wasKnockedBack = False
        Self.justSpawned = False
        Self.wasFrozen = Self.IsFrozen(False)
    End Method

End Class

Class EnemyList Extends List<Enemy>

    Function _EditorFix: Void() End

    Method Compare: Int(a: Enemy, b: Enemy)
        If a.movePriority > b.movePriority
            Return -1
        End If

        If a.movePriority < b.movePriority
            Return 1
        End If

        Local player1 := controller_game.players[controller_game.player1]
        Local distA := Util.GetDist(a.x, a.y, player1.x, player1.y)
        Local distB := Util.GetDist(b.x, b.y, player1.x, player1.y)

        If distA < distB
            Return -1
        End If

        If distA > distB
            Return 1
        End If

        Return 0
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
    Const KingConga: Int = 500
    Const DeathMetal: Int = 501
    Const DeepBlues: Int = 502
    Const CoralRiff: Int = 503
    Const Fortissimole: Int = 504
    Const DeadRinger: Int = 505
    Const TheNecroDancer: Int = 506
    Const TheNecroDancer2: Int = 507
    Const TheGoldenLute: Int = 508
    Const Frankensteinway: Int = 509
    Const TheConductor: Int = 510
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
    Const KingConga: Int = 500
    Const DeathMetal: Int = 501
    Const DeepBlues: Int = 502
    Const CoralRiff: Int = 503
    Const Fortissimole: Int = 504
    Const DeadRinger: Int = 505
    Const TheNecroDancer: Int = 506
    Const TheGoldenLute: Int = 508
    Const Frankensteinway: Int = 509
    Const TheConductor: Int = 510
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
