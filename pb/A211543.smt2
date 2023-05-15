;; sequence(s): A211543
;; terms: 0 0 0 0 1 1 1 2 3 4 5 6 7 9 11 12 14 16 18 21
;; small program: ((((((1 + ((2 + x) * x)) div (1 + (2 + 2))) + 2) + x) + x) div (1 + 2)) - x
;; fast program: ((1 + (2 + ((x * x) + x))) + ((2 - x) * (2 + 2))) div ((((2 + 2) * 2) * 2) - 1)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (div (+ (+ (+ (div (+ 1 (* (+ 2 x) x)) (+ 1 (+ 2 2))) 2) x) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (div (+ (+ 1 (+ 2 (+ (* x x) x))) (* (- 2 x) (+ 2 2))) (- (* (* (+ 2 2) 2) 2) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
