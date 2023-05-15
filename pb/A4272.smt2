;; sequence(s): A4272
;; terms: 0 1 2 3 4 5 6 8 10 12 14 16 18 20 22 24 26 28 30 32
;; small program: loop(y, ((x - 2) - 2) - 2, 0) + x
;; fast program: if (2 + (2 + (2 - x))) <= 0 then (((x - 1) - 2) * 2) else x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- (- (- x 2) 2) 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (+ 2 (- 2 x))) 0) (* (- (- x 1) 2) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
