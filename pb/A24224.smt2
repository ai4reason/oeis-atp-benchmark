;; sequence(s): A24224
;; terms: 0 2 4 7 11 16 22 28 35 43 51 60 70 81 93 105 118 132 146 161
;; small program: ((loop(((x + y) + y) + y, x, 1) div 2) div 2) + x
;; fast program: ((2 + ((1 + 2) * ((x * x) + x))) div (2 * (2 + 2))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x y) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (div (v0 x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 2 (* (+ 1 2) (+ (* x x) x))) (* 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
