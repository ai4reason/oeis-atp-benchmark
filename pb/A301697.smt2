;; sequence(s): A301697
;; terms: 1 5 10 16 22 27 32 37 42 48 54 59 64 69 74 80 86 91 96 101
;; small program: ((((loop(1 + ((((x div 2) div 2) mod 2) + x), x, 2) - 2) + (if x <= 0 then 1 else x)) + x) + x) + x
;; fast program: (((((loop(1 + x, (x mod (2 + (2 + 2))) - 2, x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (mod (div (div x 2) 2) 2) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 2) (ite (<= x 0) 1 x)) x) x) x))))
(assert (forall ((x Int)) (= (f1 x) (+ 1 x))))
(assert (forall ((x Int)) (= (g1 x) (- (mod x (+ 2 (+ 2 2))) 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (v1 x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)