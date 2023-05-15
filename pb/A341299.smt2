;; sequence(s): A341299
;; terms: 1 3 7 13 20 28 36 48
;; small program: ((((2 * (2 + x)) - ((x div 2) div (1 + 2))) + x) * (1 + x)) div (2 + 2)
;; fast program: ((((1 + x) * (((x - (x div (2 + (2 + 2)))) + x) + x)) div (2 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (* (+ (- (* 2 (+ 2 x)) (div (div x 2) (+ 1 2))) x) (+ 1 x)) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ 1 x) (+ (+ (- x (div x (+ 2 (+ 2 2)))) x) x)) (+ 2 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
