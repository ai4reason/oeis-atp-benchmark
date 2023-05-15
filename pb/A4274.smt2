;; sequence(s): A4274
;; terms: 0 1 2 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35
;; small program: (loop(y, x - 2, 1) - 1) + x
;; fast program: ((if (x - 2) <= 0 then 1 else (x - 2)) - 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (ite (<= (- x 2) 0) 1 (- x 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
