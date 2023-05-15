;; sequence(s): A135295
;; terms: 0 1 2 3 4 5 6 7 8 9 100 121 144 169 196 225 256 289 324 361
;; small program: (if (((x div 2) - 2) - 2) <= 0 then 1 else x) * x
;; fast program: (if (2 + ((2 * (2 + 2)) - x)) <= 0 then x else 1) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (ite (<= (- (- (div x 2) 2) 2) 0) 1 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (ite (<= (+ 2 (- (* 2 (+ 2 2)) x)) 0) x 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
