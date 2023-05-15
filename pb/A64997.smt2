;; sequence(s): A64997
;; terms: 2 4 6 8 10 12 15 17 19 21 23 25 27 30 32 34 36 38 40 42
;; small program: 2 + ((((1 + ((x div 2) + x)) div (2 + (2 * (2 + 2)))) + x) + x)
;; fast program: 2 + ((((2 + ((x + x) + x)) div (2 * (2 + (2 * (2 + 2))))) + x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (div (+ 1 (+ (div x 2) x)) (+ 2 (* 2 (+ 2 2)))) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (div (+ 2 (+ (+ x x) x)) (* 2 (+ 2 (* 2 (+ 2 2))))) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
