;; sequence(s): A7957-A194377
;; terms: 1 3 5 7 9 10 11 12 13 14 15 16 17 18 19 21 23 25 27 29
;; small program: compr(if loop(if (x mod 2) <= 0 then ((x div 2) div (1 + (2 + 2))) else 1, 2 + x, x) <= 0 then 1 else 0, x) div 1
;; fast program: loop(((((1 + (x div (2 + (2 * (2 + 2))))) mod (1 + (2 + (2 * (2 + 2))))) mod 2) + 1) + x, x, 2) - 1
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
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod x 2) 0) (div (div x 2) (+ 1 (+ 2 2))) 1))))
(assert (forall ((x Int)) (= (g1 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (ite (<= (v1 x) 0) 1 0))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 1))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (mod (mod (+ 1 (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (- (v2 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)