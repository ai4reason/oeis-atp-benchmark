;; sequence(s): A184733
;; terms: 3 5 8 10 13 16 18 21 23 26 29 31 34 37 39 42 44 47 50 52
;; small program: (loop(((y * y) + x) div (x + y), 2 + (2 + x), 0) + x) + x
;; fast program: (((((((((((((((((((1 + x) div (1 + 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) div 2) + x) div 2) + x) div 2) div 2) + 1) + x) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (* y y) x) (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ 2 x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (div (+ (div (+ (div (+ (+ (div (+ (+ (* (+ (+ (div (+ 1 x) (+ 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) 2) x) 2) x) 2) 2) 1) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
