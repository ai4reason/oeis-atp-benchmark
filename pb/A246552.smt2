;; sequence(s): A246552
;; terms: 0 0 1 2 1 1 2 3 2 2 3 4 3 3 4 5 4 4 5 6
;; small program: ((x div 2) + (x mod (2 + 2))) div 2
;; fast program: ((2 * (x mod (2 + 2))) + x) div (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (div x 2) (mod x (+ 2 2))) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (mod x (+ 2 2))) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
