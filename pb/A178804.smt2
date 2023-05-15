;; sequence(s): A178804
;; terms: 1 1 1 2 2 3 2 4 3 5 3 6 4 7 4 8 5 9 5 10
;; small program: 1 + ((x div 2) div (2 - (x mod 2)))
;; fast program: 1 + (x div (2 * (2 - (x mod 2))))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div (div x 2) (- 2 (mod x 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div x (* 2 (- 2 (mod x 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
