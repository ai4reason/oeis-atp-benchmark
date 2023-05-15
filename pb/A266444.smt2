;; sequence(s): A266444
;; terms: 1 0 0 0 1 0 1 0 1 1 0 0 0 1 0 1 0 1 0 1
;; small program: loop(((x + y) div loop(2 + y, x div 2, 1 + (2 + 2))) + y, 1 + x, 0) mod 2
;; fast program: (((((((if ((1 + x) mod (2 + 2)) <= 0 then 2 else 1) * 2) - x) * (1 + 2)) + x) div (2 + x)) + x) mod 2
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (g1 x) (div x 2))))
(assert (= h1 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ x y) (v1 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ (* (- (* (ite (<= (mod (+ 1 x) (+ 2 2)) 0) 2 1) 2) x) (+ 1 2)) x) (+ 2 x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
