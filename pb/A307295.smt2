;; sequence(s): A307295
;; terms: 2 3 5 6 7 8 10 11 13 14 15 16 18 19 20 21 23 24 26 27
;; small program: loop(2 + (((2 + y) * y) div (x + y)), x div 2, 2) + x
;; fast program: (loop((((2 * (x + x)) div (1 + (2 * (2 * (2 + 2))))) + x) div 2, 1, 1 + (x div 2)) + 2) + x
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (div (* (+ 2 y) y) (+ x y))))))
(assert (forall ((x Int)) (= (g0 x) (div x 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (f1 x) (div (+ (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (+ 2 2))))) x) 2))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 1 (div x 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v1 x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
