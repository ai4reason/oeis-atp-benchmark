;; sequence(s): A168484
;; terms: 2 3 5 7 13 14 16 18 24 25 27 29 35 36 38 40 46 47 49 51
;; small program: (2 + ((x - (x mod (2 + 2))) + x)) + (((x div 2) + x) div 2)
;; fast program: (2 + ((x - (x mod (2 + 2))) + x)) + (((x + x) + x) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 2 (+ (- x (mod x (+ 2 2))) x)) (div (+ (div x 2) x) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (+ (- x (mod x (+ 2 2))) x)) (div (+ (+ x x) x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
