(define
    (domain pacman_mid)
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
        (invulnerable)
    )

    ;;Eat all the ghost on the map
    ;;Effect of capsule last forever
    ;;Do not need to eat all the ghost
    (:action move
        :parameters (?from ?to - location)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            ;;Avoid the ghosts OR with capsule
            (or 
                (not (isGhost ?to)) ;;Avoid the ghosts
                (invulnerable)  ;;Ignore the ghosts by the capsule
            )  
        )
        :effect (and
            (at ?to)
            (visited ?to)
            (not (at ?from))
            (when (isCapsule ?to) ;;Eat the capsule and become invulerable
                (and
                    (invulnerable)
                    (not(isCapsule ?to))
                )
            )
            (when (isFood ?to)
                (not(isFood ?to))
            )
            (when (isGhost ?to)
                (not(isGhost ?to))
            )
        )
    )
)