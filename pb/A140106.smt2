;; sequence(s): A140106
;; terms: 0 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9
;; small program: x mod (1 + (x div 2))
;; fast program: ((if x <= 0 then 1 else x) - 1) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod x (+ 1 (div x 2))))))
(assert (forall ((x Int)) (= (fast x) (div (- (ite (<= x 0) 1 x) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
