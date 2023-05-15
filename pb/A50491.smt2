;; sequence(s): A50491
;; terms: 1 13 50 185 686 2562 9636 36465 138710 529958 2032316 7818538 30161740 116635300 451980360 1754766945 6824030310 26577181950 103647597900 404703270510
;; small program: loop(2 * ((x - (x div y)) + x), x, 1 + loop((2 + y) * x, 2, x)) div (1 + x)
;; fast program: loop(2 * ((x - (x div y)) + x), x, 1 + (2 * (2 * ((x + x) + x)))) div (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (+ 2 y) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (v1 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (h2 x) (+ 1 (* 2 (* 2 (+ (+ x x) x)))))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (div (v2 x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)