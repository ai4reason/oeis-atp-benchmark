;; sequence(s): A21095
;; terms: 0 1 0 9 8 9 0 1 0 9 8 9 0 1 0 9 8 9 0 1
;; small program: (((((x div (1 + 2)) mod 2) * 2) * 2) * 2) + (x mod 2)
;; fast program: ((2 - x) * ((2 - (x mod 2)) * x)) mod (2 * (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (* (* (mod (div x (+ 1 2)) 2) 2) 2) 2) (mod x 2)))))
(assert (forall ((x Int)) (= (fast x) (mod (* (- 2 x) (* (- 2 (mod x 2)) x)) (* 2 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
