;; sequence(s): A273312
;; terms: 3 13 23 33 39 49 55 65 71 81 87 97 103 113 119 129 135 145 151 161
;; small program: (loop((1 + (if (x mod (2 + 2)) <= 0 then 2 else (2 + 2))) + x, x, 1) * 2) + 1
;; fast program: ((((((loop(0, 2 - x, 1) + x) + x) * 2) + 1) + (x mod 2)) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ 1 (ite (<= (mod x (+ 2 2)) 0) 2 (+ 2 2))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) 1))))
(assert (= f1 0))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (* (+ (+ (v1 x) x) x) 2) 1) (mod x 2)) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)