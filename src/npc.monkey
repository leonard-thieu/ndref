Strict

Import enemy
Import sprite

Class NPC Extends Enemy Abstract

    Function _EditorFix: Void() End

    Field attackedByPlayer: Bool
    Field captive: Bool
    Field glassCage: Bool
    Field flyawayDelay: Int
    Field wasCaptive: Bool
    Field cageFrontImage: Sprite
    Field cageBackImage: Sprite
    Field isMainShopkeeper: Bool
    Field saysHi: Bool = True
    Field saidHi: Bool

End Class
