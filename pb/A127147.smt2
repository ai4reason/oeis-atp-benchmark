;; sequence(s): A127147
;; terms: 43 28 15 4 ~5 ~12 ~17 ~20 ~21 ~20 ~17 ~12 ~5 4 15 28 43 60 79 100
;; small program: ((x * x) - loop(((x - 1) - 2) + x, 2 + 2, x)) - 2
;; fast program: (1 + (2 + (2 * (2 * (2 + ((2 - x) * (2 + 2))))))) + (x * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- (- x 1) 2) x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (- (* x x) (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (+ 2 (* 2 (* 2 (+ 2 (* (- 2 x) (+ 2 2))))))) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
