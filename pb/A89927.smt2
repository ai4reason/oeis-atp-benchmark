;; sequence(s): A89927
;; terms: 1 5 25 120 576 2760 13225 63365 303601 1454640 6969600 33393360 159997201 766592645 3672966025 17598237480 84318221376 403992869400 1935646125625 9274237758725
;; small program: loop(loop2(1 + (((2 * (x + x)) - y) + x), x, y, 1, 0) - x, x, 1)
;; fast program: loop(loop2(((2 * (x + x)) - y) + x, x, x - 1, (if x <= 0 then 0 else (1 + 2)) + 2, 2) div (1 + (2 + (2 + 2))), 1, 2 + x) div (1 + 2)
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 (Int) Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (+ (- (* 2 (+ x x)) y) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (= i1 1))
(assert (= j1 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x y) i1 j1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (w1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (- (* 2 (+ x x)) y) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) (- x 1))))
(assert (forall ((x Int)) (= (i3 x) (+ (ite (<= x 0) 0 (+ 1 2)) 2))))
(assert (= j3 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) (i3 x) j3))))
(assert (forall ((x Int)) (= (f2 x) (div (w3 x) (+ 1 (+ 2 (+ 2 2)))))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v2 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
