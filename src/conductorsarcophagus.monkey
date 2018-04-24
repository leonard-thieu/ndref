'Strict

Import conductor
Import enemy
Import logger

Class ConductorSarcophagus Extends Enemy

    Function _EditorFix: Void() End

    Field parent: Conductor
    Field spawnTimer: Int
    Field current: Enemy
    Field spawnZone: Int
    Field vibrateCounter: Int
    Field vibrateOffset: Float

End Class
