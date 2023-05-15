;; sequence(s): A325517
;; terms: 0 1 6 24 64 145 282 504 832 1305 1950 2816 3936 5369 7154 9360 12032 15249 19062 23560
;; small program: loop(((1 + (y * y)) div 2) + x, x, 0) * x
;; fast program: (((1 + (2 + (x + x))) * (2 + (x * x))) div (2 * (2 + (2 + 2)))) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ 1 (* y y)) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (div (* (+ 1 (+ 2 (+ x x))) (+ 2 (* x x))) (* 2 (+ 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
