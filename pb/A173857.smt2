;; sequence(s): A173857
;; terms: 1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
;; small program: ((if x <= 0 then 2 else x) mod (1 + 2)) div 2
;; fast program: ((if x <= 0 then 1 else x) - (x * x)) mod (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (mod (ite (<= x 0) 2 x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (- (ite (<= x 0) 1 x) (* x x)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
