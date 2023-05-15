;; sequence(s): A211664
;; terms: 1 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3
;; small program: 2 + ((x - 1) div (1 + (2 + (x div 2))))
;; fast program: (if (((x - 2) - 2) - 2) <= 0 then 0 else 1) + (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (div (- x 1) (+ 1 (+ 2 (div x 2))))))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- (- (- x 2) 2) 2) 0) 0 1) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
