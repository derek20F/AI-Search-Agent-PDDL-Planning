(define
    (domain pacman_hard)
    (:requirements :strips :typing :equality :adl)
    ;; Allow "or", "exists", "forall" in goal descriptions
    ;; Allow "when" in action effects
    ;; Support = as built-in predicate
    (:types
        location
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
    )

    
    ;;Eat all the ghosts before eating the last piece of food on the map
    ;;The effect of capsule only last for 2 steps
    (:action move
        :parameters (?from ?to - location)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (or
                (not (isGhost ?to))
                (invulnerable_step1)
                (invulnerable_step2)
            )
            ;;Leave the last piece of food until the final move
            ;;If there is no food, the pacman can not move
            (exists (?lo - location) (isFood ?lo))         
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
                    (not (isCapsule ?to)) ;;Eat the capsule
                    (invulnerable_step1) ;;Become invulnerable for next 2 steps
                )
            )

        )
    )
)