;; sequence(s): A139591
;; terms: 0 1 9 18 34 51 75 100 132 165 205 246 294 343 399 456 520 585 657 730
;; small program: ((2 * (x * x)) - (x mod 2)) + (x div 2)
;; fast program: ((2 * (x * x)) - x) + ((1 + 2) * (x div 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (* 2 (* x x)) (mod x 2)) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* 2 (* x x)) x) (* (+ 1 2) (div x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
