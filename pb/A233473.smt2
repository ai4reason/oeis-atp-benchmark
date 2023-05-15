;; sequence(s): A233473
;; terms: 0 4 7 9 11 14 16 19 21 23 26 28 31 33 36 38 40 43 45 48
;; small program: loop(loop(2 + (x + y), x + y, 2) div (1 + x), x, x)
;; fast program: ((((((1 + (((x div (2 + (2 * (2 + (2 + 2))))) + x) + x)) div (1 + (2 + 2))) + 2) + x) + (if x <= 0 then 0 else 2)) + x) - 2
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ x y))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (v1 x y) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (+ (+ (div (+ 1 (+ (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x)) (+ 1 (+ 2 2))) 2) x) (ite (<= x 0) 0 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)