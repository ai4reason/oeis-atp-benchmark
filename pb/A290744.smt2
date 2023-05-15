;; sequence(s): A290744
;; terms: 5 6 8 11 15 19 24 30 37 45 53 62 72 83 95 107 120 134 149 165
;; small program: (2 + loop((y - (x div (y + y))) + x, x, 1)) + 2
;; fast program: (1 + (2 + 2)) + (((1 + x) * (2 + (x + x))) div (1 + (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- y (div x (+ y y))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ 2 (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (+ 2 2)) (div (* (+ 1 x) (+ 2 (+ x x))) (+ 1 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
