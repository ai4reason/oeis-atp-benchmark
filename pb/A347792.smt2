;; sequence(s): A347792
;; terms: 0 1 3 4 6 7 9 11 12 14 15 17 19 20 22 23 25 26 28 30
;; small program: ((loop((y * y) div (x - y), x + x, 0) div (1 + 2)) + x) + x
;; fast program: (((2 * ((2 * (x + x)) + x)) - (if x <= 0 then 0 else 1)) div ((((2 + 2) * 2) * 2) + 1)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* y y) (- x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* 2 (+ (* 2 (+ x x)) x)) (ite (<= x 0) 0 1)) (+ (* (* (+ 2 2) 2) 2) 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
