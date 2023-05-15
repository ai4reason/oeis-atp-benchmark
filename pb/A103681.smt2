;; sequence(s): A103681
;; terms: 0 1 2 3 4 5 6 9 10 11 12 13 14 15 16 17 18 19 20 21
;; small program: (2 mod loop(y, (x - 2) - 2, 1)) + x
;; fast program: (if (((x - 2) - 2) - 2) <= 0 then 0 else 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- (- x 2) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (mod 2 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- (- (- x 2) 2) 2) 0) 0 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
