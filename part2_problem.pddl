(define
    (problem pacman-level-1)
    (:domain pacman_mid)

;; problem map
;;  | 1 | 2 | 3 | 4 | 5 |
;; -|---|--- ---|---|---|
;; a| P | _ | _ | G | F |
;; b| C | _ | _ | G | _ |
;;  |---|---|---|---|---|

  



    (:objects
        ;;G - ghost
        ;;F - food
        ;;C - capsule
        a1 a2 a3 a4 a5 b1 b2 b3 b4 b5 - location
        ;;safe -bool
	)
	
	(:init
        (connected a1 a2) ;;instead of write for each, is there other method?
        (connected a2 a1)  
        (connected a2 a3)
        (connected a3 a2)
        (connected a3 a4)
        (connected a4 a3)
        (connected a4 a5)
        (connected a5 a4)
        (connected b1 b2)
        (connected b2 b1)
        (connected b2 b3)
        (connected b3 b2)
        (connected b3 b4)
        (connected b4 b3)
        (connected b4 b5)
        (connected b5 b4)
        (connected a1 b1)
        (connected b1 a1)
        (connected a2 b2)
        (connected b2 a2)
        (connected a3 b3)
        (connected b3 a3)
        (connected a4 b4)
        (connected b4 a4)
        (connected a5 b5)
        (connected b5 a5)
        (isGhost a4)
        (isGhost b4)
        (isFood a5)
        (isCapsule b1)
        (at a1)
        ;;(isSafe safe);;not sure
        ;;(not isInvulnerable)
	)

    (:goal
        (visited a5)
	)
)