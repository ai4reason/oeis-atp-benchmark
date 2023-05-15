;; sequence(s): A47268
;; terms: 1 2 5 7 8 11 13 14 17 19 20 23 25 26 29 31 32 35 37 38
;; small program: 1 + ((x - ((x mod (1 + 2)) mod 2)) + x)
;; fast program: ((loop(y, x mod (1 + 2), 2) - 1) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (- x (mod (mod x (+ 1 2)) 2)) x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (v0 x) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)