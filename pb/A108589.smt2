;; sequence(s): A108589
;; terms: 2 5 8 11 13 16 19 22 24 27 30 33 35 38 41 44 46 49 52 55
;; small program: 2 + (((x - ((x div 2) div 2)) + x) + x)
;; fast program: 2 + (((x - (x div (2 + 2))) + x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (- x (div (div x 2) 2)) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (- x (div x (+ 2 2))) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
