;; sequence(s): A211958
;; terms: 0 3 12 37 90 186 343 582 927 1405 2046 2883 3952 5292 6945 8956 11373 14247 17632 21585
;; small program: (loop(x + y, loop(x + y, x, x) - 2, x) + x) + x
;; fast program: (1 + (loop((x * x) + x, 1, (((x * x) + x) div 2) + x) div 2)) - (if (x * x) <= 0 then 1 else (x * x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (g0 x) (- (v1 x) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (f2 x) (+ (* x x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ (div (+ (* x x) x) 2) x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ 1 (div (v2 x) 2)) (ite (<= (* x x) 0) 1 (* x x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
