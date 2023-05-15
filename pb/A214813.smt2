;; sequence(s): A214813
;; terms: 0 1 3 6 9 12 15 18 21
;; small program: x - (2 mod (1 - (x + x)))
;; fast program: if (2 - x) <= 0 then ((1 + 2) * (x - 1)) else x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (mod 2 (- 1 (+ x x)))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- 2 x) 0) (* (+ 1 2) (- x 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
