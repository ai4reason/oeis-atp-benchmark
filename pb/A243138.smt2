;; sequence(s): A243138
;; terms: 13 29 47 67 89 113 139 167 197 229 263 299 337 377 419 463 509 557 607 659
;; small program: ((1 + x) * ((loop(x * x, 2, 2) - 2) + x)) - 1
;; fast program: ((1 + ((2 * (2 + (2 + 2))) + x)) * (1 + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 x) (+ (- v0 2) x)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ (* 2 (+ 2 (+ 2 2))) x)) (+ 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
