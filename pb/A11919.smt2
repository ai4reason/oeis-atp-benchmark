;; sequence(s): A11919
;; terms: 0 0 0 0 2 13 40 93 186 336 560 880 1320 1906 2669 3640 4853 6346 8160 10336
;; small program: (loop(((y * y) - y) + x, x - 2, 0) * x) div (1 + 2)
;; fast program: (loop(((x * x) * x) - x, 1, x - 2) * x) div (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* y y) y) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (* (v0 x) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (f1 x) (- (* (* x x) x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (- x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (v1 x) x) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
