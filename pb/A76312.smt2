;; sequence(s): A76312
;; terms: 0 2 4 6 8 10 12 14 16 18 1 3 5 7 9 11 13 15 17 19
;; small program: (2 * (x mod (2 + (2 * (2 + 2))))) + ((x div 2) div (1 + (2 + 2)))
;; fast program: (2 * (x mod (2 + (2 * (2 + 2))))) + (x div (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (mod x (+ 2 (* 2 (+ 2 2))))) (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (mod x (+ 2 (* 2 (+ 2 2))))) (div x (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
