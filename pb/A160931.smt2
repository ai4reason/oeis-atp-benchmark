;; sequence(s): A160931
;; terms: 3 5 7 9 11 13 15 17 10 12 14 16 18 20 22 24 26 28 21 23
;; small program: (loop(((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2)))), 1, 2 + x) + 1) + x
;; fast program: (loop(((0 - (x div (2 + (2 * (2 + 2))))) * ((2 * (2 + 2)) + 1)) + x, 1, 2 + x) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2))))))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (* (- 0 (div x (+ 2 (* 2 (+ 2 2))))) (+ (* 2 (+ 2 2)) 1)) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v1 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
