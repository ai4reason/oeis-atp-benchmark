;; sequence(s): A222257
;; terms: 1 2 3 4 5 9 7 8 15 10 11 21 13 14 27 16 17 33 19 20
;; small program: ((if (2 - (x mod (1 + 2))) <= 0 then x else 2) - 1) + x
;; fast program: 1 + loop((x - 2) + x, (x mod (1 + 2)) - 1, x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (ite (<= (- 2 (mod x (+ 1 2))) 0) x 2) 1) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (- x 2) x))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)