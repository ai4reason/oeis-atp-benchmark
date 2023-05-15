;; sequence(s): A211663
;; terms: 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3
;; small program: 2 + ((x - 2) div (2 + (((x div 2) + 2) + 2)))
;; fast program: 1 - ((2 - (x + x)) div (((2 + 2) * (1 + 2)) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (div (- x 2) (+ 2 (+ (+ (div x 2) 2) 2)))))))
(assert (forall ((x Int)) (= (fast x) (- 1 (div (- 2 (+ x x)) (+ (* (+ 2 2) (+ 1 2)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
