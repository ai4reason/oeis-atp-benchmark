;; sequence(s): A258016
;; terms: 19 39 61 81 103 123 145 165 187 207 229 249 271 291 313 333 355 375 397 417
;; small program: (loop((2 * (((x div y) + 2) + x)) + x, 2, x) - 1) + x
;; fast program: (2 * ((2 * ((1 + (2 + 2)) * (1 + x))) + (x div 2))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (+ (+ (div x y) 2) x)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (+ (* 2 (* (+ 1 (+ 2 2)) (+ 1 x))) (div x 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
