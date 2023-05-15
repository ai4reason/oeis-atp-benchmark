;; sequence(s): A48298
;; terms: 0 1 2 0 4 0 0 0 8 0 0 0 0 0 0 0 16 0 0 0
;; small program: if loop((2 + x) mod y, x, 0) <= 0 then x else 0
;; fast program: (if (((((2 * (2 * (2 + 2))) - x) - x) * (2 * (2 + 2))) mod (if x <= 0 then 1 else x)) <= 0 then 1 else 0) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (mod (+ 2 x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= (v0 x) 0) x 0))))
(assert (forall ((x Int)) (= (fast x) (* (ite (<= (mod (* (- (- (* 2 (* 2 (+ 2 2))) x) x) (* 2 (+ 2 2))) (ite (<= x 0) 1 x)) 0) 1 0) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
