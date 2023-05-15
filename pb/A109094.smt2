;; sequence(s): A109094
;; terms: 0 1 2 5 9 13 20 25 35 41 54 61 77 85 104 113 135 145 170 181
;; small program: ((x * x) + loop(y div x, x - 2, 1)) div 2
;; fast program: ((((x - 2) - (if x <= 0 then 0 else 1)) * (1 + (x div 2))) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div y x))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ (* x x) (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (- (- x 2) (ite (<= x 0) 0 1)) (+ 1 (div x 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
