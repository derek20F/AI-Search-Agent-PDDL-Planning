(define
    (domain pacman_simple)
    (:requirements :strips :typing :equality :adl)
    ;; Allow "or", "exists", "forall" in goal descriptions
    ;; Allow "when" in action effects
    ;; Support = as built-in predicate
    (:types
        ;;pacman
        ;;ghost
        ;;food
        ;;capsule
        location
        ;;agent ;;agent is pacman or ghost or food or capsule
    )

    (:predicates
        (move ?from ?to -location)
        (at ?lo -location)
        (connected ?start ?end - location)
        (isGhost ?lo -location)
        (isFood ?lo -location)

    )


    (:action move
        :parameters (?from ?to -location)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (not (isGhost ?to))
        )
        :effect (and
            (at ?to)
            (not (at ?from))
        )
    )
)