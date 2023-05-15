;; sequence(s): A158090
;; terms: 0 6 0 6 0 0 3 3 0 0 6 0 6 0 0 3 3 0 0 6
;; small program: (1 + 2) * (((1 + x) * (x - (x div (1 + 2)))) mod (1 + 2))
;; fast program: ((1 + x) * ((2 + (x * x)) * x)) mod (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (mod (* (+ 1 x) (- x (div x (+ 1 2)))) (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (mod (* (+ 1 x) (* (+ 2 (* x x)) x)) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
