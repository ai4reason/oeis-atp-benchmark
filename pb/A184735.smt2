;; sequence(s): A184735
;; terms: 2 4 7 9 12 15 17 20 23 25 28 30 33 36 38 41 43 46 49 51
;; small program: ((loop(((y * y) div (2 + x)) + (y * (2 + 2)), x, 0) + x) div 2) + 2
;; fast program: ((((((((((1 + ((2 - x) div ((2 * (2 + 2)) + 1))) div 2) + x) div 2) + x) + x) div 2) div 2) + x) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) (* y (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (div (+ (+ (div (+ (div (+ 1 (div (- 2 x) (+ (* 2 (+ 2 2)) 1))) 2) x) 2) x) x) 2) 2) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
