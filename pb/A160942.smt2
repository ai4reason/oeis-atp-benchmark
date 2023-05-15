;; sequence(s): A160942
;; terms: 0 2 6 12 20 30 42 56 72 90 11 24 39 56 75 96 119 144 171 200
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) * (1 + x)
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) * (1 + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (- x (* (+ 1 (* 2 (+ 2 2))) (div x (+ 2 (* 2 (+ 2 2)))))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
