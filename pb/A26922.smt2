;; sequence(s): A26922
;; terms: 0 1 0 1 1 2 1 2 2 3 2 3 3 4 3 4 4 5 4 5
;; small program: ((x div 2) div 2) + (x mod 2)
;; fast program: (x div (2 + 2)) + (x mod 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (div x 2) 2) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (div x (+ 2 2)) (mod x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
