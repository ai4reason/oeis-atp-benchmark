;; sequence(s): A33847
;; terms: 14 28 56 98 112 196 224 392 448 686 784 896 1372 1568 1792 2744 3136 3584 4802 5488
;; small program: ((compr(loop((loop(x * x, 2, 2) - 2) * (x * x), 2 + 2, 2) mod (1 + x), x) + 1) * (1 + (2 + (2 + 2)))) * 2
;; fast program: ((loop(compr(loop(x * x, 1 + 2, 2 * (2 + (2 * (2 + (2 + 2))))) mod (1 + x), y), x, 0) + 1) * (1 + (2 + (2 + 2)))) * 2
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 () Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun t4 (Int) Int)
(declare-fun u4 (Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 2))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f1 x) (* (- v2 2) (* x x)))))
(assert (= g1 (+ 2 2)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (mod v1 (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (+ (v0 x) 1) (+ 1 (+ 2 (+ 2 2)))) 2))))
(assert (forall ((x Int)) (= (f5 x) (* x x))))
(assert (= g5 (+ 1 2)))
(assert (= h5 (* 2 (+ 2 (* 2 (+ 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (= v5 (u5 g5 h5)))
(assert (forall ((x Int)) (= (f4 x) (mod v5 (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) y)))
(assert (forall ((x Int)) (= (t4 x) (ite (<= (f4 x) 0) x (t4 (+ x 1))))))
(assert (forall ((x Int)) (= (u4 x) (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (v4 x y))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 0))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (* (* (+ (v3 x) 1) (+ 1 (+ 2 (+ 2 2)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
