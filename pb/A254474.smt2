;; sequence(s): A254474
;; terms: 0 1 30 87 172 285 426 595 792 1017 1270 1551 1860 2197 2562 2955 3376 3825 4302 4807
;; small program: (((x * x) - x) * (loop(x * x, 2, 2) - 2)) + x
;; fast program: (2 * ((1 + (2 + (2 + 2))) * ((x * x) - x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (- (* x x) x) (- v0 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ 1 (+ 2 (+ 2 2))) (- (* x x) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
