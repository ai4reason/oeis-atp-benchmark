;; sequence(s): A320926
;; terms: 0 0 0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 0
;; small program: loop((((2 + y) * y) div (2 + x)) + (x div 2), 2 + x, 0) mod 2
;; fast program: if (((loop((1 + ((x div (2 + 2)) + x)) div (1 + 2), 2, x) + 1) + x) mod (2 + 2)) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 2 y) y) (+ 2 x)) (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (div (+ 1 (+ (div x (+ 2 2)) x)) (+ 1 2)))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ (+ (v1 x) 1) x) (+ 2 2)) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)