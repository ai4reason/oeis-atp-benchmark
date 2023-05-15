;; sequence(s): A346394
;; terms: 0 1 5 20 78 324 1520 8336 53872 405600 3492416 33798016 362543104 4264455168 54540715008 753246711808 11168972683264 176937613586432 2982069587042304 53271637651996672
;; small program: loop((loop((x * y) + loop(x + x, y, 1), y - 1, 1) + x) + x, x, 0)
;; fast program: loop((loop(loop(x + x, y - 1, 2) + (x * y), y - 1, 1) + x) + x, x, 0)
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* x y) (v2 x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- y 1))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (v1 x y) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f5 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) (- y 1))))
(assert (= h5 2))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y) h5))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (v5 x y) (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (- y 1))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y) h4))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (+ (v4 x y) x) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 0))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (v3 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
