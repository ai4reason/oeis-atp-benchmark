;; sequence(s): A17095
;; terms: 128 10000000 612220032 8031810176 52523350144 230539333248 781250000000 2207984167552 5455160701056 12151280273024 24928547056768 47829690000000 86812553324672 150363025899136
;; small program: loop2((1 + (y + y)) * (x * x), y, 1 + 2, 2, x + x) div 2
;; fast program: loop(loop((x * x) * x, 1, x * x) * x, 1, 2 + (2 * (2 * (x + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 (+ y y)) (* x x)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 (+ 1 2)))
(assert (= i0 2))
(assert (forall ((x Int)) (= (j0 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (div (w0 x) 2))))
(assert (forall ((x Int)) (= (f2 x) (* (* x x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (v2 x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (* 2 (* 2 (+ x x)))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
