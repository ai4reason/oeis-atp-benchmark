;; sequence(s): A82562
;; terms: 1 2 4 8 15 24 35 48 63 80 99 120 143 168 195 224 255 288 323 360
;; small program: ((x * x) - 1) + (2 div (if x <= 0 then 1 else x))
;; fast program: ((x * x) - loop(x div 2, 1 + (2 - x), 2)) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (* x x) 1) (div 2 (ite (<= x 0) 1 x))))))
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (- 2 x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* x x) (v0 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
