;; sequence(s): A130218
;; terms: 1 3 10 29 70 146 273 470 759 1165 1716 2443 3380 4564 6035 7836 10013 12615 15694 19305
;; small program: 1 + loop((loop(x + y, y, 0) * y) + x, x, x)
;; fast program: ((((1 + (((2 * (2 + x)) + x) * x)) * ((2 + x) * x)) div (2 * (2 * (2 + (2 + 2))))) + 1) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (v1 x y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ 1 (* (+ (* 2 (+ 2 x)) x) x)) (* (+ 2 x) x)) (* 2 (* 2 (+ 2 (+ 2 2))))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
