;; sequence(s): A336867
;; terms: 3 5 7 8 9 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
;; small program: ((2 - ((1 - x) div (1 + (x div 2)))) + 2) + x
;; fast program: ((2 - ((2 - (x + x)) div (2 + x))) + 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (- 2 (div (- 1 x) (+ 1 (div x 2)))) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 2 (div (- 2 (+ x x)) (+ 2 x))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
