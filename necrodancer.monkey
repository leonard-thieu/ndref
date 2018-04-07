Strict

Import monkey.list
Import beastmaster
Import beatanimationdata
Import bombtrap
Import bossmaster
Import bouncer
Import bouncetrap
Import chest
Import confusetrap
Import controller_game
Import crate
Import exitmap
Import firetrap
Import gamedata
Import gargoyle
Import image
Import item
Import level
Import level_object
Import medic
Import merlin
Import particles
Import player_class
Import player_health
Import point
Import portal_seg
Import rect
Import rect_room
Import rng
Import room_with_door
Import salechest
Import scattertrap
Import shopkeeper
Import shrine
Import slowdowntrap
Import speeduptrap
Import spells
Import sprite
Import swarm_sarcophagus
Import tile
Import tiledata
Import trapdoor
Import travelrune
Import util
Import xml

Global asd: List<Object>

Function Main: Int()
    controller_game.currentDepth = 1
    controller_game.currentZone = 1
    controller_game.currentLevel = 1

    Local levelObj := New LevelObject(1, 0, 0, False, Null)
    Level.CreateMap(Null)

    asd.Clear()

    NoTrim()

    Return 0
End Function

Function NoTrim: Void()
    (New Beastmaster()).NoTrim()
    (New BeatAnimationData())
    (New BombTrap(0, 0)).NoTrim()
    (New Bossmaster()).NoTrim()
    (New Bouncer())
    (New BounceTrap()).NoTrim()
    (New Chest()).NoTrim()
    (New ConfuseTrap()).NoTrim()
    (New Crate()).NoTrim()
    (New ExitMap())
    (New FireTrap()).NoTrim()
    (New GameData()).NoTrim()
    (New Gargoyle())
    (New Image())
    (New Item()).NoTrim()
    (New Level()).NoTrim()
    (New LevelObject(0, 0, 0, False, Null)).NoTrim()
    (New Medic()).NoTrim()
    (New Merlin()).NoTrim()
    (New ParticleSystem())
    (New Player()).NoTrim()
    (New PlayerHealth())
    (New Point()).NoTrim()
    (New Point2())
    (New PortalSeg())
    (New Rect()).NoTrim()
    (New RectRoom())
    (New RNG()).NoTrim()
    (New RoomWithDoor())
    (New SaleChest()).NoTrim()
    (New ScatterTrap()).NoTrim()
    (New Shopkeeper()).NoTrim()
    (New Shrine()).NoTrim()
    (New SlowDownTrap()).NoTrim()
    (New SpeedUpTrap()).NoTrim()
    (New Spells())
    (New SpikeTrap()).NoTrim()
    (New Sprite()).NoTrim()
    (New StackEx<Int>())
    (New SwarmSarcophagus()).NoTrim()
    (New Tile()).NoTrim()
    (New TileData())
    (New TrapDoor()).NoTrim()
    (New TravelRune()).NoTrim()
    (New TeleportTrap()).NoTrim()
    (New Util()).NoTrim()
    (New XMLNode()).NoTrim()

    controller_game.currentZone = 0
    controller_game.currentLevel = 0
End Function

Class Doppelganger End Class
Class ElectricArc End Class
Class FireballData End Class
Class PulseData End Class
Class Replay End Class
Class ReplayData End Class
Class SpriteInitData End Class
Class Weapon End Class
Class Zap End Class

Interface Callback End Interface
Class AdvanceLevel_callback Extends Callback End Class
Class FadeIn_callback Extends Callback End Class
Class FadeOut_callback Extends Callback End Class

Interface IItemPredicate Extends Callback End Interface
Class EnchantWeaponPredicate Extends IItemPredicate End Class
Class TransmutePredicate Extends IItemPredicate End Class
Class UncertaintyRingPredicate Extends IItemPredicate End Class
Class UncertaintyWeaponPredicate Extends IItemPredicate End Class

Class BlobRoom Extends RoomBase End Class

Class Bomb Extends Item End Class

Class DecorativeFireTrap Extends Trap End Class
Class FrankensteinwaySwitch Extends Trap End Class
Class Switch Extends Trap End Class

Class CrystalShards Extends Entity End Class
Class FloorPulse Extends Entity End Class
Class MoleDirt Extends Entity End Class

Class Dove Extends FamiliarFixed End Class
Class IceSpirit Extends FamiliarFixed End Class
Class Rat Extends FamiliarFixed End Class
Class ShieldFamiliar Extends FamiliarFixed End Class
Class ShopkeeperFamiliar Extends FamiliarFixed End Class
Class SoulFamiliar Extends FamiliarFixed End Class

Class Familiar Extends MobileEntity End Class

Class GuiBorder End Class
Class GuiContainer End Class
Class HighScoreSubmission End Class
Class InputDevice End Class
Class JoyState End Class
Class LeaderboardRow End Class
Class Minimap End Class
Class OptionList End Class
Class SoundData End Class
Class SubtitleData End Class
Class WeightedPicker End Class

Class App End Class
Class NecroDancerGame Extends App End Class

Class GuiComponent End Class
Class TextLabel Extends GuiComponent End Class
Class Checkbox Extends TextLabel End Class
Class Slider Extends TextLabel End Class
Class TextInput Extends TextLabel End Class

Class Controller End Class
Class ControllerBossIntro Extends Controller End Class
Class ControllerGame Extends Controller End Class

Class BBGameDelegate End Class
Class GameDelegate Extends BBGameDelegate End Class

Class XMLDoc Extends XMLNode End Class

'Class BackwardsEnumerator End Class
'Class BackwardsStack End Class
Class Enumerator3 End Class
Class Enumerator5 End Class
Class Enumerator8 End Class
Class Enumerator10 End Class
Class Enumerator11 End Class
Class Enumerator13 End Class
Class Enumerator14 End Class
Class Enumerator15 End Class
Class Enumerator16 End Class
Class Enumerator22 End Class
Class Enumerator24 End Class
Class Enumerator25 End Class
Class Enumerator26 End Class
Class Enumerator27 End Class
Class Enumerator28 End Class
Class Enumerator29 End Class
Class Enumerator30 End Class
Class Enumerator31 End Class
Class Enumerator32 End Class
Class Enumerator33 End Class
Class Enumerator34 End Class
Class Enumerator35 End Class
Class Enumerator36 End Class
Class Enumerator37 End Class
Class Enumerator38 End Class
Class Enumerator39 End Class
Class Enumerator40 End Class
Class Enumerator41 End Class
Class Enumerator42 End Class
Class Enumerator43 End Class
Class Enumerator44 End Class
Class Enumerator45 End Class
Class Enumerator46 End Class
Class Enumerator47 End Class
Class Enumerator48 End Class
Class Enumerator49 End Class
Class Enumerator50 End Class
Class Enumerator51 End Class
Class Enumerator52 End Class
Class Enumerator53 End Class
Class Enumerator54 End Class
Class Enumerator55 End Class
Class Enumerator56 End Class
Class Enumerator57 End Class
Class KeyEnumerator End Class
Class KeyEnumerator2 End Class
Class KeyEnumerator3 End Class
Class KeyEnumerator4 End Class
Class KeyEnumerator5 End Class
'Class List End Class
Class List3 End Class
Class List4 End Class
Class List5 End Class
Class List6 End Class
Class List9 End Class
Class List10 End Class
Class List14 End Class
Class List15 End Class
Class List19 End Class
Class List20 End Class
Class List21 End Class
Class List24 End Class
Class List29 End Class
Class List30 End Class
Class List31 End Class
Class List32 End Class
Class List38 End Class
Class List39 End Class
Class List40 End Class
Class List41 End Class
Class List42 End Class
Class List43 End Class
Class List44 End Class
Class List45 End Class
Class List46 End Class
Class List47 End Class
Class List48 End Class
Class List49 End Class
Class List50 End Class
Class List51 End Class
Class List52 End Class
Class List53 End Class
Class List54 End Class
Class List55 End Class
Class List56 End Class
Class MapKeys End Class
Class MapKeys2 End Class
Class MapKeys3 End Class
Class MapKeys4 End Class
Class MapKeys5 End Class
Class Node4 End Class
Class Node5 End Class
Class Node10 End Class
Class Node13 End Class
Class Node14 End Class
Class Node15 End Class
Class Node18 End Class
Class Node19 End Class
Class Node20 End Class
Class Node21 End Class
Class Node22 End Class
Class Node24 End Class
Class Node28 End Class
Class Node33 End Class
Class Node35 End Class
Class Node36 End Class
Class Node37 End Class
Class Node38 End Class
Class Node40 End Class
Class Node41 End Class
Class Node44 End Class
Class Node45 End Class
Class Node51 End Class
Class Node55 End Class
Class Node59 End Class
Class Node63 End Class
Class Node72 End Class
Class Node73 End Class
Class Node75 End Class
Class Node77 End Class
Class Node78 End Class
Class Node80 End Class
Class Node81 End Class
Class Node82 End Class
Class NodeEnumerator End Class
Class NodeEnumerator2 End Class
Class NodeEnumerator3 End Class
Class NodeEnumerator4 End Class
Class NodeEnumerator5 End Class
Class NodeEnumerator6 End Class
Class Stack4 End Class
Class Stack5 End Class
Class Stack11 End Class

Class Set3 End Class
Class IntPointSet Extends Set3 End Class

Class Stack2 End Class
Class StackEx2 Extends Stack2 End Class
Class IntPointStack Extends StackEx2 End Class

Class Set End Class
Class IntSet Extends Set End Class

Class Stack End Class
Class IntStack Extends Stack End Class
'Class StackEx Extends Stack End Class

Class Stack6 End Class
Class StackEx3 Extends Stack6 End Class

Class Stack7 End Class
Class StackEx4 Extends Stack7 End Class

Class Stack8 End Class
Class StackEx5 Extends Stack8 End Class

Class Stack9 End Class
Class StackEx6 Extends Stack9 End Class

Class Stack3 End Class
Class StackEx7 Extends Stack3 End Class
Class StringStack Extends Stack3 End Class

Class Stack12 End Class
Class StackEx8 Extends Stack12 End Class

Class Set2 End Class
Class StringSet Extends Set2 End Class

Class Node7 End Class
Class HeadNode3 Extends Node7 End Class

Class Node8 End Class
Class HeadNode4 Extends Node8 End Class

Class Node11 End Class
Class HeadNode5 Extends Node11 End Class

Class Node12 End Class
Class HeadNode6 Extends Node12 End Class

Class Node16 End Class
Class HeadNode9 Extends Node16 End Class

Class Node17 End Class
Class HeadNode10 Extends Node17 End Class

Class Node25 End Class
Class HeadNode15 Extends Node25 End Class

Class Node26 End Class
Class HeadNode16 Extends Node26 End Class

Class Node29 End Class
Class HeadNode19 Extends Node29 End Class

Class Node30 End Class
Class HeadNode20 Extends Node30 End Class

Class Node31 End Class
Class HeadNode21 Extends Node31 End Class

Class Node34 End Class
Class HeadNode24 Extends Node34 End Class

Class Node43 End Class
Class HeadNode26 Extends Node43 End Class

Class Node46 End Class
Class HeadNode29 Extends Node46 End Class

Class Node47 End Class
Class HeadNode30 Extends Node47 End Class

Class Node48 End Class
Class HeadNode31 Extends Node48 End Class

Class Node49 End Class
Class HeadNode32 Extends Node49 End Class

Class Node50 End Class
Class HeadNode33 Extends Node50 End Class

Class Node54 End Class
Class HeadNode37 Extends Node54 End Class

Class Node56 End Class
Class HeadNode38 Extends Node56 End Class

Class Node57 End Class
Class HeadNode39 Extends Node57 End Class

Class Node58 End Class
Class HeadNode40 Extends Node58 End Class

Class Node60 End Class
Class HeadNode41 Extends Node60 End Class

Class Node61 End Class
Class HeadNode42 Extends Node61 End Class

Class Node62 End Class
Class HeadNode43 Extends Node62 End Class

Class Node64 End Class
Class HeadNode44 Extends Node64 End Class

Class Node65 End Class
Class HeadNode45 Extends Node65 End Class

Class Node66 End Class
Class HeadNode46 Extends Node66 End Class

Class Node67 End Class
Class HeadNode47 Extends Node67 End Class

Class Node68 End Class
Class HeadNode48 Extends Node68 End Class

Class Node69 End Class
Class HeadNode49 Extends Node69 End Class

Class Node70 End Class
Class HeadNode50 Extends Node70 End Class

Class Node71 End Class
Class HeadNode51 Extends Node71 End Class

Class Node42 End Class
Class HeadNode52 Extends Node42 End Class

Class Node74 End Class
Class HeadNode54 Extends Node74 End Class

Class Node76 End Class
Class HeadNode55 Extends Node76 End Class

Class Node79 End Class
Class HeadNode56 Extends Node79 End Class

Class List26 End Class
Class IntList Extends List26 End Class

Class Map5 End Class
Class IntMap Extends Map5 End Class

Class Map6 End Class
Class IntMap2 Extends Map6 End Class

Class Map8 End Class
Class IntMap3 Extends Map8 End Class

Class Map9 End Class
Class IntMap4 Extends Map9 End Class

Class Map10 End Class
Class IntMap5 Extends Map10 End Class

Class Map17 End Class
Class IntMap7 Extends Map17 End Class

Class Map20 End Class
Class IntMap8 Extends Map20 End Class

Class Map23 End Class
Class IntMap9 Extends Map23 End Class

Class Map24 End Class
Class IntMap10 Extends Map24 End Class

Class Map25 End Class
Class IntMap11 Extends Map25 End Class

Class Map26 End Class
Class IntMap12 Extends Map26 End Class

Class List11 End Class
'Class StringList Extends List11 End Class
Class ItemList Extends List11 End Class

Class Map End Class
Class StringMap Extends Map End Class

Class Map3 End Class
Class StringMap3 Extends Map3 End Class

Class Map4 End Class
Class StringMap4 Extends Map4 End Class

Class Map7 End Class
Class StringMap5 Extends Map7 End Class

Class Map11 End Class
Class StringMap6 Extends Map11 End Class

Class Map12 End Class
Class StringMap7 Extends Map12 End Class

Class Map13 End Class
Class StringMap8 Extends Map13 End Class

Class Map15 End Class
Class StringMap9 Extends Map15 End Class

Class Map21 End Class
Class StringMap10 Extends Map21 End Class

Class Map22 End Class
Class StringMap11 Extends Map22 End Class

Class List16 End Class
Class EnemyList Extends List16 End Class

Class List37 End Class
Class IntPointList Extends List37 End Class

Class Map18 End Class
Class IntPointMap Extends Map18 End Class

Class Map19 End Class
Class IntPointMap2 Extends Map19 End Class

Class Map16 End Class
Class IntPointMap3 Extends Map16 End Class
