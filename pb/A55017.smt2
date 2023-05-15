;; sequence(s): A55017
;; terms: 0 1 2 3 4 5 6 7 8 9 ~1 0 1 2 3 4 5 6 7 8
;; small program: (x mod (2 + (2 * (2 + 2)))) - ((x div 2) div (1 + (2 + 2)))
;; fast program: ((x div (2 + (2 * (2 + 2)))) * (1 - (2 * (2 + (2 + 2))))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (mod x (+ 2 (* 2 (+ 2 2)))) (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div x (+ 2 (* 2 (+ 2 2)))) (- 1 (* 2 (+ 2 (+ 2 2))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
