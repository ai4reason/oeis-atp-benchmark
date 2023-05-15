;; sequence(s): A47392
;; terms: 0 1 3 5 7 8 10 12 14 15 17 19 21 22 24 26 28 29 31 33
;; small program: (((x div 2) + x) div 2) + x
;; fast program: (((0 - x) div (2 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div x 2) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- 0 x) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
