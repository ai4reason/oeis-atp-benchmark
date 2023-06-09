;; sequence(s): A187336
;; terms: 0 0 3 6 8 10 15 15 18 21 23 25 30 30 33 36 38 40 45 45
;; small program: (loop((2 * ((x div 2) + x)) - (x mod (1 + 2)), 2, x) + x) div (2 + 2)
;; fast program: (((((loop(1, x mod (1 + 2), 2 + 2) + x) div 2) - (x mod 2)) + x) + x) - 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* 2 (+ (div x 2) x)) (mod x (+ 1 2))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (v0 x) x) (+ 2 2)))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (mod x (+ 1 2)))))
(assert (= h1 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (- (div (+ (v1 x) x) 2) (mod x 2)) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
