;; sequence(s): A109008
;; terms: 4 1 2 1 4 1 2 1 4 1 2 1 4 1 2 1 4 1 2 1
;; small program: 1 + ((x - 1) mod (2 * (2 - (x mod 2))))
;; fast program: 1 + (((1 + x) * ((x * x) - 1)) mod (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (mod (- x 1) (* 2 (- 2 (mod x 2))))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (mod (* (+ 1 x) (- (* x x) 1)) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
