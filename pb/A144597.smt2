;; sequence(s): A144597
;; terms: 0 0 0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1
;; small program: ((((2 - x) * x) div 2) mod (1 + (2 + 2))) div (1 + 2)
;; fast program: if ((((1 + 2) * (1 + x)) mod (2 + (2 * (2 + 2)))) - 2) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (mod (div (* (- 2 x) x) 2) (+ 1 (+ 2 2))) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod (* (+ 1 2) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))) 2) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
