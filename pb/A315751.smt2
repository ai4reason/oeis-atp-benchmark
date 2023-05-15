;; sequence(s): A315751
;; terms: 1 6 12 18 23 29 35 41 47 52 58 64 70 76 82 88 93 99 105 111
;; small program: (((((((loop(1 + (((x div 2) mod 2) + x), x - 2, x) + x) div (2 + 2)) + 1) + x) + x) + x) + x) + x
;; fast program: (((((((((loop(y, x mod (2 + 2), 2) + x) div 2) + x) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (mod (div x 2) 2) x)))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (+ (div (+ (v0 x) x) (+ 2 2)) 1) x) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) y)))
(assert (forall ((x Int)) (= (g1 x) (mod x (+ 2 2)))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (div (+ (v1 x) x) 2) x) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
