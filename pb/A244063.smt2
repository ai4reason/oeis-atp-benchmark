;; sequence(s): A244063
;; terms: 0 0 0 0 1 0 0 0 1 0 1 0 1 1 0 0 1 0 1 1
;; small program: if (loop((1 + loop(x + x, x, 2)) mod (1 + x), 2, 1 + x) - 2) <= 0 then 0 else 1
;; fast program: (if (loop((1 + (2 * loop(x + x, x mod 2, loop(x * x, 1, loop(x + x, x div 2, 1))))) mod (1 + x), 2, 1 + x) - 2) <= 0 then 1 else 2) - 1
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (mod (+ 1 (v1 x)) (+ 1 x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= (- (v0 x) 2) 0) 0 1))))
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) (mod x 2))))
(assert (forall ((x Int)) (= (f4 x) (* x x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (f5 x) (+ x x))))
(assert (forall ((x Int)) (= (g5 x) (div x 2))))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (h4 x) (v5 x))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (h3 x) (v4 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (mod (+ 1 (* 2 (v3 x))) (+ 1 x)))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (ite (<= (- (v2 x) 2) 0) 1 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
