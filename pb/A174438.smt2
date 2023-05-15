;; sequence(s): A174438
;; terms: 0 2 5 8 9 11 14 17 18 20 23 26 27 29 32 35 36 38 41 44
;; small program: ((((x div 2) + (x mod (2 + 2))) div 2) + x) + x
;; fast program: ((((2 * (x mod (2 + 2))) + x) div (2 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div x 2) (mod x (+ 2 2))) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* 2 (mod x (+ 2 2))) x) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
