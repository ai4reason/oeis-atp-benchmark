;; sequence(s): A242997
;; terms: 1 4 288 1105920 445906944000 30851909057249280000 540013176648715369394995200000 3299903381977999900396941913809223680000000 9276369213749813701818662527515163802639831924736000000000
;; small program: loop(2 * (x * y), loop(x + y, x, 0), 1) * loop((1 + y) * x, x, 1)
;; fast program: loop((loop(loop2(x * y, y - 1, x, 1, ((x * x) + x) div 2), 1, y) * y) * x, x, 1) * loop2(x * y, y + y, x, 1 + x, 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun i5 () Int)
(declare-fun j5 (Int) Int)
(declare-fun u5 (Int Int Int) Int)
(declare-fun v5 (Int Int Int) Int)
(declare-fun w5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun i6 (Int) Int)
(declare-fun j6 () Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (* x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (g0 x) (v1 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (+ 1 y) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (v2 x)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) (- y 1))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (= i5 1))
(assert (forall ((x Int)) (= (j5 x) (div (+ (* x x) x) 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u5 x y z) (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v5 x y z) (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w5 x) (u5 (h5 x) i5 (j5 x)))))
(assert (forall ((x Int)) (= (f4 x) (w5 x))))
(assert (= g4 1))
(assert (forall ((x Int) (y Int)) (= (h4 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 g4 (h4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* (* (v4 x y) y) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (+ y y))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int)) (= (i6 x) (+ 1 x))))
(assert (= j6 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 (h6 x) (i6 x) j6))))
(assert (forall ((x Int)) (= (fast x) (* (v3 x) (w6 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
