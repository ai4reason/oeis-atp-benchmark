;; sequence(s): A51871
;; terms: 0 1 19 54 106 175 261 364 484 621 775 946 1134 1339 1561 1800 2056 2329 2619 2926
;; small program: ((loop((x - 1) + x, 2 + 2, x) + x) * x) div 2
;; fast program: (2 * (2 * (2 * ((x * x) - x)))) + (((x * x) + x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- x 1) x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (+ (v0 x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (* 2 (- (* x x) x)))) (div (+ (* x x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
