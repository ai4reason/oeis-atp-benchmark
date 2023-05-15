;; sequence(s): A132272-A179051-A226233-A324160
;; terms: 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2
;; small program: 1 + ((x div 2) div (1 + (2 + 2)))
;; fast program: 1 + (x div (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div x (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
