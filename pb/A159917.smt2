;; sequence(s): A159917
;; terms: 0 1 2 0 1 0 1 2 0 1 2 0 1 0 1 2 0 1 0 1
;; small program: (((compr(loop(x div (if (x mod (2 + 2)) <= 0 then 1 else 2), x, x), 2 + x) + 2) mod (2 + 2)) + 1) div 2
;; fast program: (((loop((((loop((((((x div (2 + (2 * (2 * (2 + 2))))) - x) div (2 + 2)) + x) mod 2) + x, 2, x) + x) mod 2) + 2) + x, 2, x) - x) * 2) + 2) mod (1 + 2)
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
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (div x (ite (<= (mod x (+ 2 2)) 0) 1 2)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (mod (+ (v0 x) 2) (+ 2 2)) 1) 2))))
(assert (forall ((x Int)) (= (f3 x) (+ (mod (+ (div (- (div x (+ 2 (* 2 (* 2 (+ 2 2))))) x) (+ 2 2)) x) 2) x))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (mod (+ (v3 x) x) 2) 2) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (* (- (v2 x) x) 2) 2) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
