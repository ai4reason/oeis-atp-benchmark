;; sequence(s): A171970
;; terms: 0 1 2 3 4 5 6 6 7 8 9 10 11 12 12 13 14 15 16 17
;; small program: x - ((x - (x div (1 + 2))) div (1 + (2 + 2)))
;; fast program: x - ((2 + (x + x)) div ((2 * (2 * (2 + 2))) - 1))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (div (- x (div x (+ 1 2))) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (- x (div (+ 2 (+ x x)) (- (* 2 (* 2 (+ 2 2))) 1))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
