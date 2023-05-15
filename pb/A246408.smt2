;; sequence(s): A246408
;; terms: 0 2 4 6 8 10 13 15 17 19 21 23 25 27 29 31 34 36 38 40
;; small program: (((((loop((y * y) div (x - y), x, 0) + x) div 2) + 1) div 2) + x) + x
;; fast program: (((2 + (2 * (2 + (2 + x)))) div ((((1 + 2) + 2) * (2 + 2)) + 1)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* y y) (- x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (+ (v0 x) x) 2) 1) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 2 (* 2 (+ 2 (+ 2 x)))) (+ (* (+ (+ 1 2) 2) (+ 2 2)) 1)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
