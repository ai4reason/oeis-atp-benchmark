;; sequence(s): A248524
;; terms: 3 6 9 12 15 18 22 25 28 31 34 37 40 44 47 50 53 56 59 63
;; small program: (loop(((((y * y) div ((x + x) + x)) + 2) + y) + y, x, 2) + 1) + x
;; fast program: ((1 + 2) * (1 + x)) + ((1 + (x + x)) div (((2 + (2 + 2)) * 2) + 1))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (div (* y y) (+ (+ x x) x)) 2) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ 1 x)) (div (+ 1 (+ x x)) (+ (* (+ 2 (+ 2 2)) 2) 1))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)