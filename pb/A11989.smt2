;; sequence(s): A11989
;; terms: 1 6 8 16 26
;; small program: ((2 + x) * x) + ((x - 2) mod ((1 + 2) + x))
;; fast program: ((1 + (2 + x)) * ((if (2 - x) <= 0 then 0 else 1) + x)) - 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 2 x) x) (mod (- x 2) (+ (+ 1 2) x))))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ 2 x)) (+ (ite (<= (- 2 x) 0) 0 1) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
