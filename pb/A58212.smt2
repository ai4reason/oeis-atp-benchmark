;; sequence(s): A58212
;; terms: 1 0 0 1 1 2 4 5 7 10 12 15 19 22 26 31 35 40 46 51
;; small program: 1 + ((((x * x) div (1 + 2)) - x) div 2)
;; fast program: 1 + ((((x - 2) * x) - x) div (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div (- (div (* x x) (+ 1 2)) x) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (- (* (- x 2) x) x) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
