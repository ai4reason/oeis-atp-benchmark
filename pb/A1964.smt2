;; sequence(s): A1964
;; terms: 1 6 11 17 22 27 32 37 43 48 53 58 64 69 74 79 85 90 95 100
;; small program: (loop(1 + (((y * y) div x) + y), x + x, 1) + x) + x
;; fast program: (((2 * (x + x)) + ((1 + (2 * (2 + (x + x)))) div ((((2 + 2) * 2) * 2) + 1))) + x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (div (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (* 2 (+ x x)) (div (+ 1 (* 2 (+ 2 (+ x x)))) (+ (* (* (+ 2 2) 2) 2) 1))) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
