;; sequence(s): A138587
;; terms: 0 1 2 3 5 6 10 11 21 22 42 43 85 86 170 171 341 342 682 683
;; small program: ((loop(x + x, x div 2, loop(1, 2 - x, 2)) * 2) div (1 + 2)) + (x mod 2)
;; fast program: ((loop(((if x <= 0 then 1 else loop(x + x, x, 2)) - x) - x, 1, x div 2) + x) * 2) div (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ x x))))
(assert (forall ((x Int)) (= (g0 x) (div x 2))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (h0 x) (v1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (* (v0 x) 2) (+ 1 2)) (mod x 2)))))
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (- (- (ite (<= x 0) 1 (v3 x)) x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (v2 x) x) 2) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)