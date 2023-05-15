;; sequence(s): A291306
;; terms: 0 0 2 4 0 6 6 6 8 10 6 12 12 12 14 16 12 18 18 18
;; small program: ((loop(loop2(y - x, 0 - x, y, 2, 1) - x, x, 0) + x) div 2) * 2
;; fast program: (((1 - ((2 + ((x * x) + x)) mod (2 + (2 + 2)))) * (2 - (x mod 2))) + 2) + x
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
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- y x))))
(assert (forall ((x Int)) (= (g1 x) (- 0 x))))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (= i1 2))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x y) i1 j1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (w1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (div (+ (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (- 1 (mod (+ 2 (+ (* x x) x)) (+ 2 (+ 2 2)))) (- 2 (mod x 2))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
