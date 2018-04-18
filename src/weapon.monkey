'Strict

Import monkey.list
Import monkey.map
Import logger
Import sprite
Import weaponpoint

Class Weapon

    Function IsObstructed: Bool(x: Int, y: Int, isPhasing: Bool)
        Debug.TraceNotImplemented("Weapon.IsObstructed()")
    End Function

    Function RenderAll: Void()
        Debug.TraceNotImplemented("Weapon.RenderAll()")
    End Function

    Function _EditorFix: Void() End

    Method New(t: String)
        Debug.TraceNotImplemented("Weapon.New()")
    End Method

    Field type: String = "weapon_dagger"
    Field startingRenderTime: Int
    Field hasObsSwipe: Bool
    Field swipeImage: Map<Int, Sprite> = New Map<Int, Sprite>()
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
    Field swipeImage2: Map<Int, Sprite> = New Map<Int, Sprite>()
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
        Debug.TraceNotImplemented("Weapon.Attack()")
    End Method

    Method AttackPoints: Bool(player: Object, dir: Int, isThrow: Bool, attPoints: Object)
        Debug.TraceNotImplemented("Weapon.AttackPoints()")
    End Method

    Method CanHitEnemyInDirection: Bool(player: Object, dir: Int, isThrow: Bool, attPoints: Object)
        Debug.TraceNotImplemented("Weapon.CanHitEnemyInDirection()")
    End Method

    Method DecrementStrikesForChildren: Void(attPoints: Object)
        Debug.TraceNotImplemented("Weapon.DecrementStrikesForChildren()")
    End Method

    Method GetDamage: Int()
        Debug.TraceNotImplemented("Weapon.GetDamage()")
    End Method

    Method GetTextHUD: Object()
        Debug.TraceNotImplemented("Weapon.GetTextHUD()")
    End Method

    Method HasAura: Bool(a: Int)
        Debug.TraceNotImplemented("Weapon.HasAura()")
    End Method

    Method HitCoord: Bool(x: Int, y: Int, damage: Int, dir: Int, player: Object, isThrow: Bool)
        Debug.TraceNotImplemented("Weapon.HitCoord()")
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
        Debug.TraceNotImplemented("Weapon.IsDagger()")
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
        Debug.TraceNotImplemented("Weapon.IsObstructed()")
    End Method

    Method IsRapier: Bool()
        Debug.TraceNotImplemented("Weapon.IsRapier()")
    End Method

    Method IsRifle: Bool()
        Debug.TraceNotImplemented("Weapon.IsRifle()")
    End Method

    Method IsSpear: Bool()
        Debug.TraceNotImplemented("Weapon.IsSpear()")
    End Method

    Method IsStaff: Bool()
        Debug.TraceNotImplemented("Weapon.IsStaff()")
    End Method

    Method IsThrowable: Bool()
        Debug.TraceNotImplemented("Weapon.IsThrowable()")
    End Method

    Method IsWarhammer: Bool()
        Debug.TraceNotImplemented("Weapon.IsWarhammer()")
    End Method

    Method IsWeaponCurrentlyPhasing: Bool()
        Debug.TraceNotImplemented("Weapon.IsWeaponCurrentlyPhasing()")
    End Method

    Method IsWeaponCurrentlyPiercing: Bool(player: Object)
        Debug.TraceNotImplemented("Weapon.IsWeaponCurrentlyPiercing()")
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
        Debug.TraceNotImplemented("Weapon.RenderOnHUD()")
    End Method

    Method ResetStrikes: Void(attPoints: Object)
        Debug.TraceNotImplemented("Weapon.ResetStrikes()")
    End Method

    Method StartSwipe: Void(tmpRenderTime: Int, player: Object)
        Debug.TraceNotImplemented("Weapon.StartSwipe()")
    End Method

    Method NoTrim: Void()
        IsObstructed(0, 0, False)
        RenderAll()
        Attack(Null, 0, False)
        AttackPoints(Null, 0, False, Null)
        CanHitEnemyInDirection(Null, 0, False, Null)
        DecrementStrikesForChildren(Null)
        GetDamage()
        GetTextHUD()
        HasAura(0)
        HitCoord(0, 0, 0, 0, Null, False)
        IsAxe()
        IsBlunderbuss()
        IsBow()
        IsBroadsword()
        IsCat()
        IsCrossbow()
        IsCutlass()
        IsDagger()
        IsFlail()
        IsHarp()
        IsHealing()
        IsKeepable()
        IsLongsword()
        IsLute()
        IsObstructed(0, 0)
        IsRapier()
        IsRifle()
        IsSpear()
        IsStaff()
        IsThrowable()
        IsWarhammer()
        IsWeaponCurrentlyPhasing()
        IsWeaponCurrentlyPiercing(Null)
        IsWeaponMultiHit()
        IsWhip()
        KnockPlayerBack()
        Render()
        RenderOnHUD(Null, 0, 0, 0, 0, 0)
        ResetStrikes(Null)
        StartSwipe(0, Null)
    End Method

End Class
