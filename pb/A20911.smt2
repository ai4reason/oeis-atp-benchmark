;; sequence(s): A20911
;; terms: 1 1 1 2 2 2 3 3 4 4 5 5 5 6 6 7 7 8 8 9
;; small program: (((2 - ((x div 2) div 2)) div 2) + (if x <= 0 then 1 else x)) div 2
;; fast program: (2 + ((x - (x div (2 + 2))) + x)) div ((if x <= 0 then 1 else 2) * 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (div (- 2 (div (div x 2) 2)) 2) (ite (<= x 0) 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ 2 (+ (- x (div x (+ 2 2))) x)) (* (ite (<= x 0) 1 2) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
