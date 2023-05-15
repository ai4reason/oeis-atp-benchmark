;; sequence(s): A267459
;; terms: 1 2 3 4 7 10 15 20 27 34 43 52 63 74 87 100 115 130 147 164
;; small program: 1 + ((0 - x) mod (((x * x) div 2) + 2))
;; fast program: (1 + (((x * x) div 2) - (if x <= 0 then 2 else x))) + 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (mod (- 0 x) (+ (div (* x x) 2) 2))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (- (div (* x x) 2) (ite (<= x 0) 2 x))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
