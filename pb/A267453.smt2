;; sequence(s): A267453
;; terms: 0 2 3 5 5 8 7 10 11 12 12 16 15 17 18 20 20 23 22 25
;; small program: (((((2 + x) * x) mod (2 + (2 + 2))) + (x div 2)) div 2) + x
;; fast program: (((2 * (((2 + x) * x) mod (2 + (2 + 2)))) + x) div (2 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (mod (* (+ 2 x) x) (+ 2 (+ 2 2))) (div x 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (* 2 (mod (* (+ 2 x) x) (+ 2 (+ 2 2)))) x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
