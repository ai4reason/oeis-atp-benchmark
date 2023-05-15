;; sequence(s): A115881
;; terms: 0 0 1 0 4 2 9 1 16 8 25 4 36 18 49 9 64 32 81 16
;; small program: (((1 + loop(x div (1 + (x mod 2)), 2, x)) * (1 + x)) div (2 + 2)) - (x div 2)
;; fast program: (((1 + loop(x div (1 + (x mod (2 + 2))), x mod 2, x)) * (1 + x)) div (2 + 2)) - (x div 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 (mod x 2))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (div (* (+ 1 (v0 x)) (+ 1 x)) (+ 2 2)) (div x 2)))))
(assert (forall ((x Int)) (= (f1 x) (div x (+ 1 (mod x (+ 2 2)))))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (div (* (+ 1 (v1 x)) (+ 1 x)) (+ 2 2)) (div x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)