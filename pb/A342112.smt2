;; sequence(s): A342112
;; terms: 0 0 3 24 102 312 777 1680 3276 5904 10000 16105 24883 37129 53782 75937 104857 141985 188956 247609
;; small program: (loop(x * x, 2, x) * x) div (2 + (2 * (2 + 2)))
;; fast program: ((((x * x) * x) * x) * x) div (2 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (v0 x) x) (+ 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (div (* (* (* (* x x) x) x) x) (+ 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
