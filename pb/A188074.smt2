;; sequence(s): A188074
;; terms: 7 11 18 22 26 33 37 41 48 52 59 63 67 74 78 82 89 93 97 104
;; small program: (((loop(((y * y) div (2 * (2 + x))) + y, 1 + x, 0) * (1 + 2)) + 2) + 2) + x
;; fast program: (((((((1 + 2) * ((1 + (2 + 2)) * (1 + x))) div (1 + (2 * (2 * (2 + (2 * (2 + 2))))))) + 2) + x) * (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (* 2 (+ 2 x))) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (* (v0 x) (+ 1 2)) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (div (* (+ 1 2) (* (+ 1 (+ 2 2)) (+ 1 x))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) 2) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
