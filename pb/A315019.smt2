;; sequence(s): A315019
;; terms: 1 5 9 15 19 23 29 33 37 43 47 52 57 61 67 71 75 81 85 89
;; small program: loop((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 * (2 + 2))))) + x) + 1) + (x div loop(1 + (x + x), 2, 2)), 1, 2 * (x + x))
;; fast program: loop((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 * (2 + 2))))) + x) + 1) + (x div (1 + (2 + (2 * (2 + 2))))), 1, 2 * (x + x))
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (+ x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 1) (div x v1)))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (* 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 1) (div x (+ 1 (+ 2 (* 2 (+ 2 2)))))))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (* 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (v2 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)