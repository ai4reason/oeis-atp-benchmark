;; sequence(s): A200182
;; terms: 3 6 11 14 19 26 31 38 47 54 63 74 83 94 107 118 131 146 159 174
;; small program: (1 + (2 * (loop(x + y, 2 + x, 2) div (1 + 2)))) + x
;; fast program: ((1 + ((2 + x) * x)) - (2 * (((x * x) - x) div (1 + 2)))) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (* 2 (div (v0 x) (+ 1 2)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ 1 (* (+ 2 x) x)) (* 2 (div (- (* x x) x) (+ 1 2)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
