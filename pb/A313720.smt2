;; sequence(s): A313720
;; terms: 1 5 10 15 20 24 29 34 38 43 48 53 58 63 68 73 78 82 87 92
;; small program: (((((loop(((loop2(x + y, y div 2, 1 + (2 + 2), 2, x) mod 2) + 2) + x, x, 0) + x) div 2) + 1) + x) + x) + x
;; fast program: (((((((((((((((loop((((y - ((x div 2) div (1 + 2))) mod 2) + x) + x, 2, x) + (if x <= 0 then 1 else x)) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x) + x) + x) div (if x <= 0 then 1 else 2)) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (div y 2))))
(assert (= h1 (+ 1 (+ 2 2))))
(assert (= i1 2))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 i1 (j1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (w1 x) 2) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (div (+ (v0 x) x) 2) 1) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (+ (mod (- y (div (div x 2) (+ 1 2))) 2) x) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (+ (+ (+ (div (+ (+ (- (+ (+ (+ (+ (+ (v2 x) (ite (<= x 0) 1 x)) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x) x) x) x) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)