(define
    (domain pacman_mid)
    (:requirements :strips :typing :equality :adl)
    ;; Allow "or", "exists", "forall" in goal descriptions
    ;; Allow "when" in action effects
    ;; Support = as built-in predicate
    (:types
        location
        ghost
        food
        capsule
    )

    (:predicates
        (move ?from ?to -location)
        (at ?lo -location)
        (visited ?lo -location)
        (connected ?start ?end - location)
        (isGhost ?lo -location)
        (isFood ?lo -location)
        (isCapsule ?lo -location)
        (invulnerable)
        ;;(isSafe ?safe -bool)
        

    )


    (:action move
        :parameters (?from ?to -location)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            ;;(isSafe ?safe)
            (
                or (not (isGhost ?to)) (invulnerable)
            )
            ;;((isInvulnerable ?invulnerable) or (isGhost ?to))
            ;;(when (isInvulnerable)
            ;;    (not (isGhost ?to))
            ;;)   
        )
        :effect (and
            (at ?to)
            (visited ?to)
            (not (at ?from))
            (when (isCapsule ?to)
                (invulnerable)
            )
        )
    )
)