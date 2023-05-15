;; sequence(s): A314890
;; terms: 1 5 9 14 19 23 29 33 38 43 47 52 57 61 66 71 75 81 85 90
;; small program: loop(loop(((((((x mod (1 + (2 * (2 + (2 + 2))))) div (1 + (2 * (2 + 2)))) + 1) + x) mod 2) + 2) + x, 2, x), x, 1)
;; fast program: ((((((((((1 + (2 + (2 + x))) div (1 + (2 + (2 * (2 + 2))))) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (+ (mod (+ (+ (div (mod x (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 (* 2 (+ 2 2)))) 1) x) 2) 2) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (+ (div (+ 1 (+ 2 (+ 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
