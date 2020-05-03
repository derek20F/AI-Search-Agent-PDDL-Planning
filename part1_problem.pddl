(define
    (problem pacman-level-1)
    (:domain pacman_simple)

;; problem map
;;  | 1 | 2 | 3 |
;; -|---|---|---|
;; a| P | G | F | 
;; b| _ | _ | _ | 
;;  |---|---|---| 
;; Expected Solution (move a1 b1) (move b1 b2) (move b2 b3) (move b3 a3)
  



    (:objects
        ;;P -pacman
        ;;G - ghost
        ;;F - food
        a1 a2 a3 b1 b2 b3 - location
	)
	
	(:init
        (connected a1 a2) ;;instead of write for each, is there other method?
        (connected a2 a1)  
        (connected a2 a3)
        (connected a3 a2)
        (connected b1 b2)
        (connected b2 b1)
        (connected b2 b3)
        (connected b3 b2)
        (connected a1 b1)
        (connected b1 a1)
        (connected a2 b2)
        (connected b2 a2)
        (connected a3 b3)
        (connected b3 a3)
        (isGhost a2)
        (isFood a3)
        (at a1)
	)

    (:goal
        (visited a3)
       
	)
)