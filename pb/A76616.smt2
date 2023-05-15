;; sequence(s): A76616
;; terms: 0 0 0 2 16 64 208 608 1664 4352 11008 27136 65536 155648 364544 843776 1933312 4390912 9895936 22151168
;; small program: (((((((loop(x + x, x - 1, x - 1) * x) + 1) div 2) - loop(x + x, x, 1)) div 2) + 1) div 2) * 2
;; fast program: (((((((((((loop(x + x, x, 1) * ((((x * x) - x) div 2) - 2)) + 1) + x) - 2) - x) div 2) div 2) div 2) + 1) + x) - x) * 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ x x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (* (div (+ (div (- (div (+ (* (v0 x) x) 1) 2) (v1 x)) 2) 1) 2) 2))))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (* (- (+ (+ (div (div (div (- (- (+ (+ (* (v2 x) (- (div (- (* x x) x) 2) 2)) 1) x) 2) x) 2) 2) 2) 1) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
