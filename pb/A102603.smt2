;; sequence(s): A102603
;; terms: 21 45 69 93 117 141 165 189 213 237 261 285 309 333 357 381 405 429 453 477
;; small program: 1 + (2 * loop(2 + ((2 + y) * x), 2, x))
;; fast program: (1 + 2) * ((2 * (2 * (2 + (x + x)))) - 1)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (* (+ 2 y) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (- (* 2 (* 2 (+ 2 (+ x x)))) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
