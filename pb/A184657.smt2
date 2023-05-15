;; sequence(s): A184657
;; terms: 3 6 8 11 13 16 19 21 24 26 29 32 34 37 40 42 45 47 50 53
;; small program: (loop(2 + (((y * y) div x) + y), 2 + ((x + x) + 1), 1) div 2) + x
;; fast program: (((((((((((((((((((((2 + x) div (1 + 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) div 2) + 1) + x) div 2) + 1) + x) div 2) div 2) + 1) + x) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ (+ x x) 1)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (div (+ (+ (div (+ (+ (div (+ (+ (div (+ (+ (* (+ (+ (div (+ 2 x) (+ 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) 2) 1) x) 2) 1) x) 2) 2) 1) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
