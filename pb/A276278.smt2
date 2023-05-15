;; sequence(s): A276278
;; terms: 3 5 6 7 9 10 11 12 13 14 16 17 18 19 20 21 23 24 25 26
;; small program: (2 + (((1 + (x div 2)) div (1 + 2)) + x)) + (if x <= 0 then 1 else 2)
;; fast program: (2 + (((2 + x) div (2 + (2 + 2))) + x)) + (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 2 (+ (div (+ 1 (div x 2)) (+ 1 2)) x)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (+ (div (+ 2 x) (+ 2 (+ 2 2))) x)) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
