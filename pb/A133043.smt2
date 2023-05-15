;; sequence(s): A133043
;; terms: 3 5 6 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
;; small program: (2 + (2 - ((2 - x) div (2 + x)))) + x
;; fast program: 1 + (2 + ((if (x - 2) <= 0 then (if x <= 0 then 0 else 1) else 2) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 2 (- 2 (div (- 2 x) (+ 2 x)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (+ (ite (<= (- x 2) 0) (ite (<= x 0) 0 1) 2) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
