;; sequence(s): A187180
;; terms: 1 1 2 3 2 3 4 5 4 5 6 7 6 7 8 9 8 9 10 11
;; small program: (if x <= 0 then 1 else x) - (2 * ((x div 2) div 2))
;; fast program: (if x <= 0 then 1 else x) - (2 * (x div (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (ite (<= x 0) 1 x) (* 2 (div (div x 2) 2))))))
(assert (forall ((x Int)) (= (fast x) (- (ite (<= x 0) 1 x) (* 2 (div x (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
