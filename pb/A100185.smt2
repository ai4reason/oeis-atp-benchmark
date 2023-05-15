;; sequence(s): A100185
;; terms: 1 4 19 68 185 416 819 1464 2433 3820 5731 8284 11609 15848 21155 27696 35649 45204 56563 69940
;; small program: loop(((((y - 1) + y) * (y * y)) + x) + y, x, 1) + x
;; fast program: ((((2 + (((1 + 2) * (x * x)) + x)) * ((x * x) + x)) div (2 + (2 + 2))) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (+ (- y 1) y) (* y y)) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ 2 (+ (* (+ 1 2) (* x x)) x)) (+ (* x x) x)) (+ 2 (+ 2 2))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
