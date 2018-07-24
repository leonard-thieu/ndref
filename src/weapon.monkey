'Strict

Import monkey.list
Import monkey.map
Import mojo.graphics
Import item
Import logger
Import player_class
Import point
Import sprite
Import textsprite
Import weaponpoint

Class Weapon

    Global swipingWeapons: Object

    Function IsObstructed: Bool(x: Int, y: Int, isPhasing: Bool)
        Debug.TraceNotImplemented("Weapon.IsObstructed(Int, Int, Bool)")
    End Function

    Function RenderAll: Void()
        Debug.TraceNotImplemented("Weapon.RenderAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(t: String)
        Self.startingRenderTime = 9
        Self.type = t

        If Self.type <> ItemType.NoItem
            Local itemNode := Item.GetItemXML(Self.type)

            Local numFrames := itemNode.GetAttribute("numFrames", 1)
            Local imageW := itemNode.GetAttribute("imageW", 24)
            Local imageH := itemNode.GetAttribute("imageH", 24)

            If Self.IsDagger()
                Local swipeImage: Sprite

                Select Self.type
                    Case ItemType.ObsidianDagger
                        swipeImage = New Sprite("swipes/swipe_dagger_obsidian.png", 24, 24, 9, Image.MidHandle)
                        Self.hasObsSwipe = True
                    Case ItemType.BloodDagger
                        swipeImage = New Sprite("swipes/swipe_dagger_blood.png", 3, Image.MidHandle)
                    Case ItemType.TitaniumDagger
                        swipeImage = New Sprite("swipes/swipe_dagger_titanium.png", 3, Image.MidHandle)
                    Case ItemType.GlassDagger
                        swipeImage = New Sprite("swipes/swipe_dagger_glass.png", 3, Image.MidHandle)
                    Case ItemType.GoldenDagger
                        swipeImage = New Sprite("swipes/swipe_dagger_gold.png", 3, Image.MidHandle)
                    Case ItemType.GlassShardWeapon
                        swipeImage = New Sprite("swipes/swipe_dagger_glass.png", 3, Image.MidHandle)
                    Default
                        swipeImage = New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                End Select

                Self.startingRenderTime = 6
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_dagger.png", imageW, imageH, 1)
            Else If Self.IsLongsword()
                Local swipeImage: Sprite

                Select Self.type
                    Case ItemType.ObsidianLongsword
                        swipeImage = New Sprite("swipes/swipe_longsword_obsidian.png", 48, 24, 12, Image.MidHandle)
                        Self.hasObsSwipe = True
                    Case ItemType.BloodLongsword
                        swipeImage = New Sprite("swipes/swipe_longsword_blood.png", 4, Image.MidHandle)
                    Case ItemType.TitaniumLongsword
                        swipeImage = New Sprite("swipes/swipe_longsword_titanium.png", 4, Image.MidHandle)
                    Case ItemType.GlassLongsword
                        swipeImage = New Sprite("swipes/swipe_longsword_glass.png", 4, Image.MidHandle)
                    Case ItemType.GoldenLongsword
                        swipeImage = New Sprite("swipes/swipe_longsword_gold.png", 4, Image.MidHandle)
                    Default
                        swipeImage = New Sprite("swipes/swipe_longsword.png", 4, Image.MidHandle)
                End Select

                Self.startingRenderTime = 8
                Self.numSwipeFrames = 4
                swipeImage.SetHandle(12, 12)
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_longsword.png", imageW, imageH, 1)
                Self.glowXOff = -1
                Self.glowYOff = -1
            Else If Self.IsBroadsword()
                Local swipeImage: Sprite

                Select Self.type
                    Case ItemType.ObsidianBroadsword
                        swipeImage = New Sprite("swipes/swipe_broadsword_obsidian.png", 24, 72, 9, Image.MidHandle)
                        Self.hasObsSwipe = True
                    Case ItemType.BloodBroadsword
                        swipeImage = New Sprite("swipes/swipe_broadsword_blood.png", 3, Image.MidHandle)
                    Case ItemType.TitaniumBroadsword
                        swipeImage = New Sprite("swipes/swipe_broadsword_titanium.png", 3, Image.MidHandle)
                    Case ItemType.GlassBroadsword
                        swipeImage = New Sprite("swipes/swipe_broadsword_glass.png", 3, Image.MidHandle)
                    Case ItemType.GoldenBroadsword
                        swipeImage = New Sprite("swipes/swipe_broadsword_gold.png", 3, Image.MidHandle)
                    Default
                        swipeImage = New Sprite("swipes/swipe_broadsword.png", 3, Image.MidHandle)
                End Select

                Self.startingRenderTime = 6
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(1, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint3 := New WeaponPoint(-1, -1, Self, -1, Null, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint3)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_broadsword.png", imageW, imageH, 1)
                Self.glowXOff = -1
                Self.glowYOff = -1
            Else If Self.IsBow()
                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, -1, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, 1, attackPoint1, 3, True, -1, 1)
                Local attackPoint3 := New WeaponPoint(0, -3, Self, 1, attackPoint2, 3, True, -1, 1)
                attackPoint2.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.arrowWeapon = True

                Self.glowHUD = New Sprite("items/weaponglow_bow.png", imageW, imageH, 1)
            Else If Self.IsCrossbow()
                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, 1, attackPoint1, 3, True, -1, 1)
                Local attackPoint3 := New WeaponPoint(0, -3, Self, 1, attackPoint2, 3, True, -1, 1)
                Local attackPoint4 := New WeaponPoint(0, -3, Self, 1, attackPoint3, 3, True, -1, 1)
                attackPoint3.children.AddLast(attackPoint4)
                attackPoint2.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.reloadTime = 1
                Self.clipSize = 3
                Self.arrowWeapon = True

                Local swipeImage2 := New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                Self.startingRenderTime2 = 6
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage2.Set(0, swipeImage2)

                Self.glowHUD = New Sprite("items/weaponglow_crossbow.png", imageW, imageH, 1)
            Else If Self.IsWhip()
                Self.startingRenderTime = 8
                Self.numSwipeFramesPerImage = 2
                Self.numSwipeFrames = 4

                Select Self.type
                    Case ItemType.GoldenWhip
                        Local swipeImageA := New Sprite("swipes/swipe_whip_gold_A.png", 4, Image.MidHandle)
                        swipeImageA.SetZOff(1000.0)
                        Self.swipeImage.Set(0, swipeImageA)
                        Local swipeImageB := New Sprite("swipes/swipe_whip_gold_B.png", 4, Image.MidHandle)
                        swipeImageB.SetZOff(1000.0)
                        Self.swipeImage.Set(1, swipeImageB)
                        Local swipeImageC := New Sprite("swipes/swipe_whip_gold_C.png", 4, Image.MidHandle)
                        swipeImageC.SetZOff(1000.0)
                        Self.swipeImage.Set(2, swipeImageC)
                        Local swipeImageD := New Sprite("swipes/swipe_whip_gold_D.png", 4, Image.MidHandle)
                        swipeImageD.SetZOff(1000.0)
                        Self.swipeImage.Set(3, swipeImageD)
                        Local swipeImageE := New Sprite("swipes/swipe_whip_gold_E.png", 4, Image.MidHandle)
                        swipeImageE.SetZOff(1000.0)
                        Self.swipeImage.Set(4, swipeImageE)
                    Case ItemType.ObsidianWhip
                        Local swipeImageA := New Sprite("swipes/swipe_whip_obsidian_A.png", 24, 120, 12, Image.MidHandle)
                        swipeImageA.SetZOff(1000.0)
                        Self.swipeImage.Set(0, swipeImageA)
                        Local swipeImageB := New Sprite("swipes/swipe_whip_obsidian_B.png", 24, 120, 12, Image.MidHandle)
                        swipeImageB.SetZOff(1000.0)
                        Self.swipeImage.Set(1, swipeImageB)
                        Local swipeImageC := New Sprite("swipes/swipe_whip_obsidian_C.png", 24, 120, 12, Image.MidHandle)
                        swipeImageC.SetZOff(1000.0)
                        Self.swipeImage.Set(2, swipeImageC)
                        Local swipeImageD := New Sprite("swipes/swipe_whip_obsidian_D.png", 24, 120, 12, Image.MidHandle)
                        swipeImageD.SetZOff(1000.0)
                        Self.swipeImage.Set(3, swipeImageD)
                        Local swipeImageE := New Sprite("swipes/swipe_whip_obsidian_E.png", 24, 120, 12, Image.MidHandle)
                        swipeImageE.SetZOff(1000.0)
                        Self.swipeImage.Set(4, swipeImageE)

                        Self.hasObsSwipe = True
                    Default
                        Local swipeImageA := New Sprite("swipes/swipe_whip_A.png", 4, Image.MidHandle)
                        swipeImageA.SetZOff(1000.0)
                        Self.swipeImage.Set(0, swipeImageA)
                        Local swipeImageB := New Sprite("swipes/swipe_whip_B.png", 4, Image.MidHandle)
                        swipeImageB.SetZOff(1000.0)
                        Self.swipeImage.Set(1, swipeImageB)
                        Local swipeImageC := New Sprite("swipes/swipe_whip_C.png", 4, Image.MidHandle)
                        swipeImageC.SetZOff(1000.0)
                        Self.swipeImage.Set(2, swipeImageC)
                        Local swipeImageD := New Sprite("swipes/swipe_whip_D.png", 4, Image.MidHandle)
                        swipeImageD.SetZOff(1000.0)
                        Self.swipeImage.Set(3, swipeImageD)
                        Local swipeImageE := New Sprite("swipes/swipe_whip_E.png", 4, Image.MidHandle)
                        swipeImageE.SetZOff(1000.0)
                        Self.swipeImage.Set(4, swipeImageE)
                End Select

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, False, 2, 1)
                Local attackPoint2 := New WeaponPoint(-1, -1, Self, 1, attackPoint1, 2, False, 1, 1)
                Local attackPoint3 := New WeaponPoint(1, -1, Self, 1, attackPoint1, 0, False, 3, 1)
                Local attackPoint4 := New WeaponPoint(-1, -1, Self, 1, attackPoint1, 2, True, 1, 0)
                Local attackPoint5 := New WeaponPoint(-2, -1, Self, 1, attackPoint4, 2, True, 0, 1)
                Local attackPoint6 := New WeaponPoint(1, -1, Self, 1, attackPoint1, 0, True, 3, 0)
                Local attackPoint7 := New WeaponPoint(2, -1, Self, 1, attackPoint6, 0, True, 4, 1)
                attackPoint1.children.AddLast(attackPoint2)
                attackPoint1.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint4)
                attackPoint4.children.AddLast(attackPoint5)
                attackPoint1.children.AddLast(attackPoint6)
                attackPoint6.children.AddLast(attackPoint7)
                Self.attackPoints.AddLast(attackPoint1)

                Self.glowHUD = New Sprite("items/weaponglow_whip.png", imageW, imageH, 1)
            Else If Self.IsFlail()
                Self.startingRenderTime = 6
                Local swipeImage := New Sprite("swipes/swipe_flail.png", 5, Image.MidHandle)
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(-1, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint3 := New WeaponPoint(-1, 0, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint4 := New WeaponPoint(1, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint5 := New WeaponPoint(1, 0, Self, -1, Null, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint3)
                Self.attackPoints.AddLast(attackPoint4)
                Self.attackPoints.AddLast(attackPoint5)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_flail.png", imageW, imageH, 1)
            Else If Self.IsCat()
                Self.startingRenderTime = 8
                Self.numSwipeFramesPerImage = 2
                Self.numSwipeFrames = 4
                Local swipeImageA := New Sprite("swipes/swipe_cat_A.png", 4, Image.MidHandle)
                swipeImageA.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImageA)
                Local swipeImageB := New Sprite("swipes/swipe_cat_B.png", 4, Image.MidHandle)
                swipeImageB.SetZOff(1000.0)
                Self.swipeImage.Set(1, swipeImageB)
                Local swipeImageC := New Sprite("swipes/swipe_cat_C.png", 4, Image.MidHandle)
                swipeImageC.SetZOff(1000.0)
                Self.swipeImage.Set(2, swipeImageC)
                Local swipeImageD := New Sprite("swipes/swipe_cat_D.png", 4, Image.MidHandle)
                swipeImageD.SetZOff(1000.0)
                Self.swipeImage.Set(3, swipeImageD)
                Local swipeImageE := New Sprite("swipes/swipe_cat_E.png", 4, Image.MidHandle)
                swipeImageE.SetZOff(1000.0)
                Self.swipeImage.Set(4, swipeImageE)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, False, 2, 1)
                Local attackPoint2 := New WeaponPoint(-1, -1, Self, 1, attackPoint1, 2, False, 1, 1)
                Local attackPoint3 := New WeaponPoint(1, -1, Self, 1, attackPoint1, 0, False, 3, 1)
                Local attackPoint4 := New WeaponPoint(-1, 0, Self, 1, attackPoint1, 2, True, 0, 1)
                Local attackPoint5 := New WeaponPoint(1, 0, Self, 1, attackPoint1, 0, True, 4, 1)
                attackPoint1.children.AddLast(attackPoint2)
                attackPoint1.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint4)
                attackPoint1.children.AddLast(attackPoint5)
                Self.attackPoints.AddLast(attackPoint1)

                Self.glowHUD = New Sprite("items/weaponglow_cat.png", imageW, imageH, 1)
                Self.glowYOff = 1
            Else If Self.IsRapier()
                Self.daggerSwipeAdjacent = True

                Local swipeImage: Sprite
                Local swipeImage2: Sprite

                Select Self.type
                    Case ItemType.ObsidianRapier
                        swipeImage = New Sprite("swipes/swipe_rapier_obsidian.png", 48, 24, 12, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_obsidian.png", 24, 24, 9, Image.MidHandle)

                        Self.hasObsSwipe = True
                        Self.hasObsSwipe2 = True
                    Case ItemType.BloodRapier
                        swipeImage = New Sprite("swipes/swipe_rapier_blood.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_blood.png", 3, Image.MidHandle)
                    Case ItemType.TitaniumRapier
                        swipeImage = New Sprite("swipes/swipe_rapier_titanium.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_titanium.png", 3, Image.MidHandle)
                    Case ItemType.GlassRapier
                        swipeImage = New Sprite("swipes/swipe_rapier_glass.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_glass.png", 3, Image.MidHandle)
                    Case ItemType.GoldenRapier
                        swipeImage = New Sprite("swipes/swipe_rapier_golden.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_golden.png", 3, Image.MidHandle)
                    Default
                        swipeImage = New Sprite("swipes/swipe_rapier.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                End Select

                swipeImage.SetHandle(24, 12)
                Self.startingRenderTime = 8
                Self.startingRenderTime2 = 6
                Self.numSwipeFrames = 4
                swipeImage.SetZOff(1000.0)
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)
                Self.swipeImage2.Set(0, swipeImage2)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, 1, attackPoint1, 3, True, 0, 2)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_rapier.png", imageW, imageH, 1)
            Else If Self.IsSpear()
                Self.daggerSwipeAdjacent = True

                Local swipeImage: Sprite
                Local swipeImage2: Sprite

                Select Self.type
                    Case ItemType.ObsidianSpear
                        swipeImage = New Sprite("swipes/swipe_spear_obsidian.png", 48, 24, 12, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_obsidian.png", 24, 24, 9, Image.MidHandle)

                        Self.hasObsSwipe = True
                        Self.hasObsSwipe2 = True
                    Case ItemType.BloodSpear
                        swipeImage = New Sprite("swipes/swipe_spear_blood.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_blood.png", 3, Image.MidHandle)
                    Case ItemType.TitaniumSpear
                        swipeImage = New Sprite("swipes/swipe_spear_titanium.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_titanium.png", 3, Image.MidHandle)
                    Case ItemType.GlassSpear
                        swipeImage = New Sprite("swipes/swipe_spear_glass.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_glass.png", 3, Image.MidHandle)
                    Case ItemType.GoldenSpear
                        swipeImage = New Sprite("swipes/swipe_spear_golden.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger_golden.png", 3, Image.MidHandle)
                    Default
                        swipeImage = New Sprite("swipes/swipe_spear.png", 4, Image.MidHandle)
                        swipeImage2 = New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                End Select

                swipeImage.SetHandle(12, 12)
                Self.startingRenderTime = 8
                Self.startingRenderTime2 = 6
                Self.numSwipeFrames = 4
                swipeImage.SetZOff(1000.0)
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)
                Self.swipeImage2.Set(0, swipeImage2)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, 1, attackPoint1, 3, True, 0, 1)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_spear.png", imageW, imageH, 1)
            Else If Self.IsBlunderbuss()
                Local swipeImage := New Sprite("swipes/swipe_blunderbuss.png", 8, Image.MidHandle)
                swipeImage.SetHandle(-2, 59)
                Self.startingRenderTime = 16
                Self.numSwipeFrames = 8
                Self.numSwipeFramesPerImage = 2
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(-1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint3 := New WeaponPoint(0, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint4 := New WeaponPoint(1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint5 := New WeaponPoint(-2, -3, Self, -1, attackPoint2, 3, True, 0, 1)
                Local attackPoint6 := New WeaponPoint(-1, -3, Self, -1, attackPoint2, 3, True, 0, 1)
                Local attackPoint7 := New WeaponPoint(0, -3, Self, -1, attackPoint3, 3, True, 0, 1)
                Local attackPoint8 := New WeaponPoint(1, -3, Self, -1, attackPoint4, 3, True, 0, 1)
                Local attackPoint9 := New WeaponPoint(2, -3, Self, -1, attackPoint4, 3, True, 0, 1)
                attackPoint1.children.AddLast(attackPoint2)
                attackPoint1.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint4)
                attackPoint2.children.AddLast(attackPoint5)
                attackPoint2.children.AddLast(attackPoint6)
                attackPoint3.children.AddLast(attackPoint7)
                attackPoint4.children.AddLast(attackPoint8)
                attackPoint4.children.AddLast(attackPoint9)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True
                Self.reloadTime = 1
                Self.clipSize = 1

                Local swipeImage2 := New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                Self.startingRenderTime2 = 6
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage2.Set(0, swipeImage2)
            Else If Self.IsRifle()
                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, -1, attackPoint1, 3, True, -1, 1)
                Local attackPoint3 := New WeaponPoint(0, -3, Self, -1, attackPoint2, 3, True, -1, 1)
                Local attackPoint4 := New WeaponPoint(0, -4, Self, -1, attackPoint3, 3, True, -1, 1)
                Local attackPoint5 := New WeaponPoint(0, -5, Self, -1, attackPoint4, 3, True, -1, 1)
                Local attackPoint6 := New WeaponPoint(0, -6, Self, -1, attackPoint5, 3, True, -1, 1)
                Local attackPoint7 := New WeaponPoint(0, -7, Self, -1, attackPoint6, 3, True, -1, 1)
                Local attackPoint8 := New WeaponPoint(0, -8, Self, -1, attackPoint7, 3, True, -1, 1)
                Local attackPoint9 := New WeaponPoint(0, -9, Self, -1, attackPoint8, 3, True, -1, 1)
                Local attackPoint10 := New WeaponPoint(0, -10, Self, -1, attackPoint9, 3, True, -1, 1)
                Local attackPoint11 := New WeaponPoint(0, -11, Self, -1, attackPoint10, 3, True, -1, 1)
                Local attackPoint12 := New WeaponPoint(0, -12, Self, -1, attackPoint11, 3, True, -1, 1)
                Local attackPoint13 := New WeaponPoint(0, -13, Self, -1, attackPoint12, 3, True, -1, 1)
                Local attackPoint14 := New WeaponPoint(0, -14, Self, -1, attackPoint13, 3, True, -1, 1)
                Local attackPoint15 := New WeaponPoint(0, -15, Self, -1, attackPoint14, 3, True, -1, 1)
                Local attackPoint16 := New WeaponPoint(0, -16, Self, -1, attackPoint15, 3, True, -1, 1)
                Local attackPoint17 := New WeaponPoint(0, -17, Self, -1, attackPoint16, 3, True, -1, 1)
                Local attackPoint18 := New WeaponPoint(0, -18, Self, -1, attackPoint17, 3, True, -1, 1)
                Local attackPoint19 := New WeaponPoint(0, -19, Self, -1, attackPoint18, 3, True, -1, 1)
                Local attackPoint20 := New WeaponPoint(0, -20, Self, -1, attackPoint19, 3, True, -1, 1)
                attackPoint1.children.AddLast(attackPoint2)
                attackPoint2.children.AddLast(attackPoint3)
                attackPoint3.children.AddLast(attackPoint4)
                attackPoint4.children.AddLast(attackPoint5)
                attackPoint5.children.AddLast(attackPoint6)
                attackPoint6.children.AddLast(attackPoint7)
                attackPoint7.children.AddLast(attackPoint8)
                attackPoint8.children.AddLast(attackPoint9)
                attackPoint9.children.AddLast(attackPoint10)
                attackPoint10.children.AddLast(attackPoint11)
                attackPoint11.children.AddLast(attackPoint12)
                attackPoint12.children.AddLast(attackPoint13)
                attackPoint13.children.AddLast(attackPoint14)
                attackPoint14.children.AddLast(attackPoint15)
                attackPoint15.children.AddLast(attackPoint16)
                attackPoint16.children.AddLast(attackPoint17)
                attackPoint17.children.AddLast(attackPoint18)
                attackPoint18.children.AddLast(attackPoint19)
                attackPoint19.children.AddLast(attackPoint20)
                Self.attackPoints.AddLast(attackPoint1)

                Self.reloadTime = 1
                Self.clipSize = 3
                Self.arrowWeapon = True

                Local swipeImage2 := New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                Self.startingRenderTime2 = 6
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage2.Set(0, swipeImage2)
            Else If Self.IsAxe()
                Self.daggerSwipeAdjacent = True

                Local swipeImage := New Sprite("swipes/swipe_broadsword.png", 3, Image.MidHandle)
                Local swipeImage2 := New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                Self.startingRenderTime = 6
                Self.startingRenderTime2 = 6
                swipeImage.SetZOff(1000.0)
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)
                Self.swipeImage2.Set(0, swipeImage2)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint3 := New WeaponPoint(1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint4 := New WeaponPoint(-1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                attackPoint1.children.AddLast(attackPoint2)
                attackPoint1.children.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint4)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_axe.png", imageW, imageH, 1)
            Else If Self.IsHarp()
                Self.startingRenderTime = 10
                Self.numSwipeFrames = 5
                Local swipeImage := New Sprite("swipes/swipe_harp.png", 5)
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_harp.png", imageW, imageH, 1)
            Else If Self.IsWarhammer()
                Self.startingRenderTime = 8
                Local swipeImage := New Sprite("swipes/swipe_broadsword.png", 3, Image.MidHandle)
                swipeImage.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)
                Self.startingRenderTime2 = 8
                Self.numSwipeFrames2 = 4
                Local swipeImage2 := New Sprite("swipes/swipe_warhammer.png", 4, Image.MidHandle)
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage2.Set(0, swipeImage2)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(1, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint3 := New WeaponPoint(-1, -1, Self, -1, Null, 3, True, 0, 1)
                Local attackPoint4 := New WeaponPoint(1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint5 := New WeaponPoint(-1, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Local attackPoint6 := New WeaponPoint(0, -2, Self, -1, attackPoint1, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint3)
                attackPoint1.children.AddLast(attackPoint4)
                attackPoint1.children.AddLast(attackPoint5)
                attackPoint1.children.AddLast(attackPoint6)
                Self.attackPoints.AddLast(attackPoint1)

                Self.glowHUD = New Sprite("items/weaponglow_warhammer.png", imageW, imageH, 1)
            Else If Self.IsStaff()
                Local attackPoint1 := New WeaponPoint(0, -1, Self, -1, Null, 3, True, 0, 1)
                Self.attackPoints.AddLast(attackPoint1)

                Self.glowHUD = New Sprite("items/weaponglow_staff.png", imageW, imageH, 1)
            Else If Self.IsCutlass()
                Self.daggerSwipeAdjacent = True

                Local swipeImage := New Sprite("swipes/swipe_rapier.png", 4, Image.MidHandle)
                Local swipeImage2 := New Sprite("swipes/swipe_dagger.png", 3, Image.MidHandle)
                swipeImage.SetHandle(12, 12)
                Self.startingRenderTime = 8
                Self.startingRenderTime2 = 6
                Self.numSwipeFrames = 4
                swipeImage.SetZOff(1000.0)
                swipeImage2.SetZOff(1000.0)
                Self.swipeImage.Set(0, swipeImage)
                Self.swipeImage2.Set(0, swipeImage2)

                Local attackPoint1 := New WeaponPoint(0, -1, Self, 1, Null, 3, True, 0, 1)
                Local attackPoint2 := New WeaponPoint(0, -2, Self, 1, attackPoint1, 3, True, 0, 1)
                attackPoint1.children.AddLast(attackPoint2)
                Self.attackPoints.AddLast(attackPoint1)

                Self.flipEachHit = True

                Self.glowHUD = New Sprite("items/weaponglow_cutlass.png", imageW, imageH, 1)
            End If

            Self.currentClipSize = Self.clipSize

            Self.imageHUD = New Sprite(itemNode.value, imageW, imageH, 2 * numFrames)
            Self.imageHUD.InWorld = False
            Self.imageHUD.SetZ(10000.0)

            If Self.glowHUD <> Null
                Self.glowHUD.InWorld = False
                Self.glowHUD.SetZ(9998.0)
            End If
        End If
    End Method

    Field type: String = ItemType.Dagger
    Field startingRenderTime: Int
    Field hasObsSwipe: Bool
    Field swipeImage: IntMap<Sprite> = New IntMap<Sprite>()
    Field flipEachHit: Bool
    Field glowHUD: Sprite
    Field numSwipeFrames: Int = 3
    Field glowXOff: Int
    Field glowYOff: Int
    Field attackPoints: List<WeaponPoint> = New List<WeaponPoint>()
    Field arrowWeapon: Bool
    Field reloadTime: Int
    Field clipSize: Int = 1
    Field startingRenderTime2: Int
    Field swipeImage2: IntMap<Sprite> = New IntMap<Sprite>()
    Field numSwipeFramesPerImage: Int = 2
    Field daggerSwipeAdjacent: Bool
    Field hasObsSwipe2: Bool
    Field numSwipeFrames2: Int = 3
    Field currentClipSize: Int = 1
    Field imageHUD: Sprite
    Field clipEmptyAttack: Bool
    Field currentReloadDelay: Int
    Field attackDir: Int = -1
    Field playerX: Int
    Field playerY: Int
    Field playerDir: Int
    Field warhammerObstructed: Bool
    Field lastPointHit: Point
    Field swipeImageHitFrame: Int = -1
    Field useMeleeSwipe: Bool
    Field renderTime: Int
    Field renderPlayer: Player
    Field aura: Int
    Field textHUD: TextSprite
    Field numSwipeFramesPerImage2: Int = 2

    Method Attack: Bool(player: Object, dir: Int, isThrow: Bool)
        Debug.TraceNotImplemented("Weapon.Attack(Object, Int, Bool)")
    End Method

    Method AttackPoints: Bool(player: Object, dir: Int, isThrow: Bool, attPoints: Object)
        Debug.TraceNotImplemented("Weapon.AttackPoints(Object, Int, Bool, Object)")
    End Method

    Method CanHitEnemyInDirection: Bool(player: Object, dir: Int, isThrow: Bool, attPoints: Object)
        Debug.TraceNotImplemented("Weapon.CanHitEnemyInDirection(Object, Int, Bool, Object)")
    End Method

    Method DecrementStrikesForChildren: Void(attPoints: Object)
        Debug.TraceNotImplemented("Weapon.DecrementStrikesForChildren(Object)")
    End Method

    Method GetDamage: Int()
        Debug.TraceNotImplemented("Weapon.GetDamage()")
    End Method

    Method GetTextHUD: Object()
        Debug.TraceNotImplemented("Weapon.GetTextHUD()")
    End Method

    Method HasAura: Bool(a: Int)
        Debug.TraceNotImplemented("Weapon.HasAura(Int)")
    End Method

    Method HitCoord: Bool(x: Int, y: Int, damage: Int, dir: Int, player: Object, isThrow: Bool)
        Debug.TraceNotImplemented("Weapon.HitCoord(Int, Int, Int, Int, Object, Bool)")
    End Method

    Method IsAxe: Bool()
        Debug.TraceNotImplemented("Weapon.IsAxe()")
    End Method

    Method IsBlunderbuss: Bool()
        Debug.TraceNotImplemented("Weapon.IsBlunderbuss()")
    End Method

    Method IsBow: Bool()
        Debug.TraceNotImplemented("Weapon.IsBow()")
    End Method

    Method IsBroadsword: Bool()
        Debug.TraceNotImplemented("Weapon.IsBroadsword()")
    End Method

    Method IsCat: Bool()
        Debug.TraceNotImplemented("Weapon.IsCat()")
    End Method

    Method IsCrossbow: Bool()
        Debug.TraceNotImplemented("Weapon.IsCrossbow()")
    End Method

    Method IsCutlass: Bool()
        Debug.TraceNotImplemented("Weapon.IsCutlass()")
    End Method

    Method IsDagger: Bool()
        Select Self.type
            Case ItemType.Dagger,
                 ItemType.GoldenDagger,
                 ItemType.TitaniumDagger,
                 ItemType.ObsidianDagger,
                 ItemType.BloodDagger,
                 ItemType.GlassDagger,
                 ItemType.GlassShardWeapon,
                 ItemType.JeweledDagger,
                 ItemType.DaggerOfFrost,
                 ItemType.DaggerOfPhasing,
                 ItemType.Flower,
                 ItemType.Fangs,
                 ItemType.ElectricDagger,
                 ItemType.Eli
                Return True
        End Select

        Return False
    End Method

    Method IsFlail: Bool()
        Debug.TraceNotImplemented("Weapon.IsFlail()")
    End Method

    Method IsHarp: Bool()
        Debug.TraceNotImplemented("Weapon.IsHarp()")
    End Method

    Method IsHealing: Bool()
        Debug.TraceNotImplemented("Weapon.IsHealing()")
    End Method

    Method IsKeepable: Bool()
        Debug.TraceNotImplemented("Weapon.IsKeepable()")
    End Method

    Method IsLongsword: Bool()
        Debug.TraceNotImplemented("Weapon.IsLongsword()")
    End Method

    Method IsLute: Bool()
        Debug.TraceNotImplemented("Weapon.IsLute()")
    End Method

    Method IsObstructed: Bool(x: Int, y: Int)
        Debug.TraceNotImplemented("Weapon.IsObstructed(Int, Int)")
    End Method

    Method IsRapier: Bool()
        Debug.TraceNotImplemented("Weapon.IsRapier()")
    End Method

    Method IsRifle: Bool()
        Debug.TraceNotImplemented("Weapon.IsRifle()")
    End Method

    Method IsSpear: Bool()
        Select Self.type
            Case ItemType.Spear,
                 ItemType.GoldenSpear,
                 ItemType.TitaniumSpear,
                 ItemType.ObsidianSpear,
                 ItemType.BloodSpear,
                 ItemType.GlassSpear
                Return True
        End Select

        Return False
    End Method

    Method IsStaff: Bool()
        Debug.TraceNotImplemented("Weapon.IsStaff()")
    End Method

    Method IsThrowable: Bool()
        If Self.IsSpear()
            Return True
        End If

        If Self.IsDagger()
            Select Self.type
                Case ItemType.Flower,
                     ItemType.Fangs,
                     ItemType.Eli
                    Return False
            End Select

            Return True
        End If

        Return False
    End Method

    Method IsWarhammer: Bool()
        Debug.TraceNotImplemented("Weapon.IsWarhammer()")
    End Method

    Method IsWeaponCurrentlyPhasing: Bool()
        Debug.TraceNotImplemented("Weapon.IsWeaponCurrentlyPhasing()")
    End Method

    Method IsWeaponCurrentlyPiercing: Bool(player: Object)
        Debug.TraceNotImplemented("Weapon.IsWeaponCurrentlyPiercing(Object)")
    End Method

    Method IsWeaponMultiHit: Bool()
        Debug.TraceNotImplemented("Weapon.IsWeaponMultiHit()")
    End Method

    Method IsWhip: Bool()
        Debug.TraceNotImplemented("Weapon.IsWhip()")
    End Method

    Method KnockPlayerBack: Bool()
        Debug.TraceNotImplemented("Weapon.KnockPlayerBack()")
    End Method

    Method Render: Void()
        Debug.TraceNotImplemented("Weapon.Render()")
    End Method

    Method RenderOnHUD: Void(player: Object, xVal: Int, yVal: Int, zVal: Int, scale: Float, alpha: Float)
        Debug.TraceNotImplemented("Weapon.RenderOnHUD(Object, Int, Int, Int, Float, Float)")
    End Method

    Method ResetStrikes: Void(attPoints: Object)
        Debug.TraceNotImplemented("Weapon.ResetStrikes(Object)")
    End Method

    Method StartSwipe: Void(tmpRenderTime: Int, player: Object)
        Debug.TraceNotImplemented("Weapon.StartSwipe(Int, Object)")
    End Method

End Class
