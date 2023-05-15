;; sequence(s): A285960
;; terms: 1 1 1 0 1 1 0 1 1 1 1 0 1 1 1 0 1 1 1 0
;; small program: compr(loop(if (x mod 2) <= 0 then (x div 2) else 2, x + x, x) - 1, 2 + (x + x)) mod 2
;; fast program: ((loop((((loop2((y - x) div 2, x, 1 + (2 + (2 + 2)), x div 2, x) + x) div 2) mod 2) + x, 2, x) + 1) + x) mod 2
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun i3 (Int) Int)
(declare-fun j3 (Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod x 2) 0) (div x 2) 2))))
(assert (forall ((x Int)) (= (g1 x) (+ x x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (- (v1 x) 1))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (div (- y x) 2))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int)) (= (i3 x) (div x 2))))
(assert (forall ((x Int)) (= (j3 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 h3 (i3 x) (j3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (mod (div (+ (w3 x) x) 2) 2) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (+ (v2 x) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
