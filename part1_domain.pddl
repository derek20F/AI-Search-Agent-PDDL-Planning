(define
    (domain pacman_simple)
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

    )

    ;;Eat all the food, while avoiding the ghosts
    (:action move
        :parameters (?from ?to - location)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (not (isGhost ?to)) ;;Avoid the ghosts
        )
        :effect (and
            (at ?to)
            (visited ?to)
            (not (at ?from))
            ;;Consume the food
            (when (isFood ?to)
                (not(isFood ?to))
            )
        )
    )
)