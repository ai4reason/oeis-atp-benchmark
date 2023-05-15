;; sequence(s): A274406
;; terms: 0 8 9 17 18 26 27 35 36 44 45 53 54 62 63 71 72 80 81 89
;; small program: (2 * (2 * ((x mod 2) + x))) + (x div 2)
;; fast program: ((1 + (2 + (2 + 2))) * (x - (x div 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (* 2 (+ (mod x 2) x))) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 (+ 2 2))) (- x (div x 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
