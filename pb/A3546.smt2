;; sequence(s): A3546
;; terms: 1 3 5 11 15 17 25 31 33 41 51 55 75 85 93 123 155 165 187 205
;; small program: loop(compr((loop((2 * (x * x)) * x, 1 + 2, 2) + x) mod (1 + x), y), x, 0) + 1
;; fast program: compr(((loop((x * x) * x, 1, loop(x * x, 2, 2 * (2 + 2))) * loop(x * x, 2, 2)) - 1) mod (1 + x), x) + 1
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 () Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 () Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 () Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (* (* 2 (* x x)) x))))
(assert (= g2 (+ 1 2)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f1 x) (mod (+ v2 x) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (f4 x) (* (* x x) x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (f5 x) (* x x))))
(assert (= g5 2))
(assert (= h5 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (= v5 (u5 g5 h5)))
(assert (= h4 v5))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (= v4 (u4 g4 h4)))
(assert (forall ((x Int)) (= (f6 x) (* x x))))
(assert (= g6 2))
(assert (= h6 2))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (= v6 (u6 g6 h6)))
(assert (forall ((x Int)) (= (f3 x) (mod (- (* v4 v6) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v3 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
