;; sequence(s): A241979
;; terms: 0 1 1 0 0 0 1 0 0 1 1 1 0 1 1 0 0 0 1 0
;; small program: ((((x mod (1 + 2)) div 2) - x) div 2) mod 2
;; fast program: ((((2 * (x * x)) + x) div (2 + (2 + 2))) + x) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (div (- (div (mod x (+ 1 2)) 2) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ (* 2 (* x x)) x) (+ 2 (+ 2 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
