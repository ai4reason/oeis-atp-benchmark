;; sequence(s): A226279
;; terms: 0 ~1 0 ~1 2 1 2 1 4 3 4 3 6 5 6 5 8 7 8 7
;; small program: (2 * ((x div 2) div 2)) - (x mod 2)
;; fast program: (2 * (x div (2 + 2))) - (x mod 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* 2 (div (div x 2) 2)) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (div x (+ 2 2))) (mod x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
