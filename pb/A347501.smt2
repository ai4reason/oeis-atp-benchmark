;; sequence(s): A347501
;; terms: 17 81 405 2025 10125 50625 253125 1265625 6328125 31640625 158203125 791015625 3955078125 19775390625 98876953125 494384765625 2471923828125 12359619140625 61798095703125 308990478515625
;; small program: loop((2 * ((x - (x mod (1 + 2))) + x)) + x, x, 1 + (2 * (2 * (2 + 2))))
;; fast program: ((((1 + 2) * loop2(x * y, y, x, (1 + 2) * (1 + (2 * (2 + 2))), 1 + (2 + 2))) - 1) div (1 + (2 + 2))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* 2 (+ (- x (mod x (+ 1 2))) x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 (* 2 (* 2 (+ 2 2))))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 (* (+ 1 2) (+ 1 (* 2 (+ 2 2))))))
(assert (= j1 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* (+ 1 2) (w1 x)) 1) (+ 1 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)