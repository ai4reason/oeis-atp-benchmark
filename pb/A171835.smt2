;; sequence(s): A171835
;; terms: 3 7 12 18 29 41 54 68 87 107 128 150 177 205 234 264 299 335 372 410
;; small program: (loop((((2 - (y mod (2 + 2))) + x) + y) + y, x, 1) + 2) + x
;; fast program: ((((1 + ((x * x) * x)) mod (2 + 2)) + ((2 + x) * x)) + (x div 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (- 2 (mod y (+ 2 2))) x) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (mod (+ 1 (* (* x x) x)) (+ 2 2)) (* (+ 2 x) x)) (div x 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
