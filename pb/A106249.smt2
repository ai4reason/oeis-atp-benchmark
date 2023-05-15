;; sequence(s): A106249
;; terms: 1 0 1 2 3 2 3 4 5 4 5 6 7 6 7 8 9 8 9 10
;; small program: (x div 2) + (((2 - x) div 2) mod 2)
;; fast program: 1 + ((2 * ((0 - x) div (2 + 2))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div x 2) (mod (div (- 2 x) 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* 2 (div (- 0 x) (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
