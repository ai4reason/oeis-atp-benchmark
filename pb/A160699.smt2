;; sequence(s): A160699
;; terms: 0 17 154 531 1268 2485 4302 6839 10216 14553 19970 26587 34524 43901 54838 67455 81872 98209 116586 137123
;; small program: ((((loop(2 * (2 + x), 2, 2) * x) * x) - 2) * x) - x
;; fast program: (2 * (2 * (((1 + (2 + 2)) * ((x * x) * x)) - x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* (- (* (* v0 x) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (- (* (+ 1 (+ 2 2)) (* (* x x) x)) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
