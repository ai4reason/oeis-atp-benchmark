;; sequence(s): A140438
;; terms: 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2
;; small program: if (((x div 2) - 2) - 2) <= 0 then 1 else 2
;; fast program: if (2 + ((2 * (2 + 2)) - x)) <= 0 then 2 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- (- (div x 2) 2) 2) 0) 1 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (- (* 2 (+ 2 2)) x)) 0) 2 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
