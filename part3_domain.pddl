(define
    (domain pacman_hard)
    (:requirements :strips :typing :equality :adl)
    ;; Allow "or", "exists", "forall" in goal descriptions
    ;; Allow "when" in action effects
    ;; Support = as built-in predicate
    (:types
        location
        ;;ghost
        ;;food
        ;;capsule
    )

    (:predicates
        (move ?from ?to - location)
        (at ?lo - location)
        (visited ?lo - location)
        (connected ?start ?end - location)
        (isGhost ?lo - location)
        (isFood ?lo - location)
        (isCapsule ?lo - location)
        (invulnerable_step1)
        (invulnerable_step2)
        ;;(firstStep)
        ;;(secondStep)
        ;;(eatAllGhost)
        
        
        ;;(isSafe ?safe -bool)
        

    )

    ;;eat all ghost >> then eat food

    (:action move
        :parameters (?from ?to - location)
        :precondition (and 
            ;;(not (exists (?lo - location) (isGhost ?lo)))
            (at ?from)
            (connected ?from ?to)
            ;;(isSafe ?safe)
            (
                or (not (isGhost ?to)) (invulnerable_step1) (invulnerable_step2) ;;(eatAllGhost)
            )
            
            (
                or (not (isFood ?to)) (not (exists (?lo - location) (isGhost ?lo))) ;;can eat food, only after eat all ghost
            )

            
        )
        :effect (and
            (at ?to)
            (visited ?to)
            (not (at ?from))
            
            (when (isGhost ?to)
                (not (isGhost ?to))
            )

            (when (isFood ?to)
                (not (isFood ?to))
            )
            
            (when (invulnerable_step2)
                (not(invulnerable_step2))
            )
            
            (when (invulnerable_step1)
                (and
                    (not (invulnerable_step1))
                    (invulnerable_step2)
                )
            )
            
            (when (isCapsule ?to)
                (and
                    (not (isCapsule ?to))
                    (invulnerable_step1)
                )
            )

        )
    )
)