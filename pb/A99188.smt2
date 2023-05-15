;; sequence(s): A99188
;; terms: 0 2 4 6 6 8 10 10 12 14 16 16 18 20 20 22 24 26 26 28
;; small program: loop(y - ((x * y) div ((x + x) + y)), x, 0) * 2
;; fast program: (((1 - ((2 * (2 * ((x + x) + x))) div (1 + (2 * (2 * (2 + (2 * (2 + 2)))))))) + x) * 2) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (* x y) (+ (+ x x) y))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (- 1 (div (* 2 (* 2 (+ (+ x x) x))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))))) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
