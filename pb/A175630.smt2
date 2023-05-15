;; sequence(s): A175630
;; terms: 0 1 1 2 4 0 3 7 2 7 1 7 0 7 15 7 16 7 17 7
;; small program: loop((x - 2) + y, x, 2) mod (2 + x)
;; fast program: (2 + (2 + (((x * x) - x) div 2))) mod (2 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) (+ 2 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ 2 (+ 2 (div (- (* x x) x) 2))) (+ 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
