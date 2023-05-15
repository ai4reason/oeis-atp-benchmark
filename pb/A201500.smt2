;; sequence(s): A201500
;; terms: 2 2 6 5 12 8 20 13 30 18 42 25 56 32 72 41 90 50 110 61
;; small program: ((((x div (1 + (x mod 2))) * (2 + (x div 2))) + x) div 2) + 2
;; fast program: ((1 + x) - (((2 - x) * x) div (2 * (2 + 2)))) * (2 - (x mod 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (* (div x (+ 1 (mod x 2))) (+ 2 (div x 2))) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (- (+ 1 x) (div (* (- 2 x) x) (* 2 (+ 2 2)))) (- 2 (mod x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
