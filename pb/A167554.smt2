;; sequence(s): A167554
;; terms: ~2 ~5 ~7 ~6 0 13 35 68 114 175 253 350 468 609 775 968 1190 1443 1729 2050
;; small program: loop((((y - 2) * y) - 2) + x, x, 0) - 2
;; fast program: (((((((x - 1) + x) * ((x * x) - x)) div (2 + (2 + 2))) - x) - 2) - x) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* (- y 2) y) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (- (- (- (div (* (+ (- x 1) x) (- (* x x) x)) (+ 2 (+ 2 2))) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
