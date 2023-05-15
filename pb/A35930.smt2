;; sequence(s): A35930-A257850-A330633
;; terms: 0 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9
;; small program: ((x div 2) div (1 + (2 + 2))) * (x mod (2 + (2 * (2 + 2))))
;; fast program: (x div (2 + (2 * (2 + 2)))) * (x mod (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (fast x) (* (div x (+ 2 (* 2 (+ 2 2)))) (mod x (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
