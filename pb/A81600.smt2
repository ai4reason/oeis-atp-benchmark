;; sequence(s): A81600-A324161
;; terms: 0 1 2 3 4 5 6 7 8 9 9 10 11 12 13 14 15 16 17 18
;; small program: x - ((x div 2) div (1 + (2 + 2)))
;; fast program: x - (x div (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (- x (div x (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
