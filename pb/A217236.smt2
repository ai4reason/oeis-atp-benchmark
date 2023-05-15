;; sequence(s): A217236
;; terms: 55 71 75 79
;; small program: loop((((1 + 2) * ((1 mod x) + 2)) + x) * 2, 2 + 1, 1 + x) div 2
;; fast program: ((((1 + (2 * (2 + (2 + 2)))) + (if x <= 0 then 1 else (2 + 2))) + x) * (2 + 2)) - 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ (* (+ 1 2) (+ (mod 1 x) 2)) x) 2))))
(assert (= g0 (+ 2 1)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (+ (+ 1 (* 2 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 (+ 2 2))) x) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
