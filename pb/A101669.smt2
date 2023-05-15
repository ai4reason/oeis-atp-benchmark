;; sequence(s): A101669
;; terms: 0 1 2 0 0 1 0 1 0 1 2 0 0 1 2 0 0 1 2 0
;; small program: loop((if (x mod 2) <= 0 then 2 else x) div 2, x, x div 2) * (2 - (x mod 2))
;; fast program: ((loop(loop((loop(x div loop(1, x mod (2 + 2), 2 + 2), x mod (2 + 2), 1 + x) mod 2) + x, (x mod (2 + 2)) - 2, x) - 2, 1, x div 2) + x) mod 2) * (2 - (x mod 2))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 () Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (ite (<= (mod x 2) 0) 2 x) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (- 2 (mod x 2))))))
(assert (= f4 1))
(assert (forall ((x Int)) (= (g4 x) (mod x (+ 2 2)))))
(assert (= h4 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y f4))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (div x (v4 x)))))
(assert (forall ((x Int)) (= (g3 x) (mod x (+ 2 2)))))
(assert (forall ((x Int)) (= (h3 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (mod (v3 x) 2) x))))
(assert (forall ((x Int)) (= (g2 x) (- (mod x (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (- (v2 x) 2))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (mod (+ (v1 x) x) 2) (- 2 (mod x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)