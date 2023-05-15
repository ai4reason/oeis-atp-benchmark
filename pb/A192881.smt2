;; sequence(s): A192881
;; terms: 1 3 5 8 10 11 13 15 17 19
;; small program: (loop(1 + (x div y), x - 2, 1) + x) + x
;; fast program: ((if ((if ((x - 2) - 2) <= 0 then x else 0) - 2) <= 0 then 1 else 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (div x y)))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (- (ite (<= (- (- x 2) 2) 0) x 0) 2) 0) 1 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
