;; sequence(s): A17446
;; terms: 1048576 576650390625 141167095653376 4808584372417849 64925062108545024 511116753300641401 2824752490000000000 12157665459056928801 43438845422363213824 134391637934412192049
;; small program: loop2(((x * x) * x) * y, x, 2, (2 * (2 + ((2 * (x + x)) + x))) + x, 1)
;; fast program: loop((x * x) * x, 2, (2 * (2 + ((2 * (x + x)) + x))) + x) * ((2 * (2 + ((2 * (x + x)) + x))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (* (* x x) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) (+ (* 2 (+ 2 (+ (* 2 (+ x x)) x))) x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) (+ (* 2 (+ 2 (+ (* 2 (+ x x)) x))) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v1 x) (+ (* 2 (+ 2 (+ (* 2 (+ x x)) x))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)