;; sequence(s): A193866
;; terms: 0 6 11 35 46 88 105 165 188 266 295 391 426 540 581 713 760 910 963 1131
;; small program: ((1 + 2) * (((x mod 2) + x) * x)) - (x div 2)
;; fast program: ((1 + (2 * ((x + x) + x))) * (x - (x div 2))) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 2) (* (+ (mod x 2) x) x)) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (* 2 (+ (+ x x) x))) (- x (div x 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
