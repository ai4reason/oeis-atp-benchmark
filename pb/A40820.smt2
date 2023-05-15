;; sequence(s): A40820
;; terms: 29 6 2 6 58 6 2 6 58 6 2 6 58 6 2 6 58 6 2 6
;; small program: ((loop(if (x mod 2) <= 0 then 1 else (x div 2), x mod (2 + 2), loop(2 + (x + x), 2, 2)) * 2) + 1) * (if x <= 0 then 1 else 2)
;; fast program: ((((loop(loop(x * x, 2, 2), 1 - (x mod (2 + 2)), 2) + (x mod 2)) * 2) - (if x <= 0 then 1 else 2)) * (if x <= 0 then 1 else 2)) - 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 () Int)
(declare-fun f2 () Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (ite (<= (mod x 2) 0) 1 (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 2 2)))))
(assert (forall ((x Int)) (= (f1 x) (+ 2 (+ x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (= h0 v1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (* (v0 x) 2) 1) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (f3 x) (* x x))))
(assert (= g3 2))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (= v3 (u3 g3 h3)))
(assert (= f2 v3))
(assert (forall ((x Int)) (= (g2 x) (- 1 (mod x (+ 2 2))))))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y f2))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (- (* (- (* (+ (v2 x) (mod x 2)) 2) (ite (<= x 0) 1 2)) (ite (<= x 0) 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
