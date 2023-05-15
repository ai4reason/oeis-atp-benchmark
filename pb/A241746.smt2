;; sequence(s): A241746
;; terms: 23 103 163 223 283 343 403 463 523 583 643 703 763 823 883 943 1003 1063 1123 1183
;; small program: loop((((2 * (x * y)) + (if x <= 0 then 1 else 2)) + x) * 2, 2, x) - 1
;; fast program: (1 + (2 * (2 * ((1 + (2 + 2)) * ((if x <= 0 then 1 else 2) + ((x + x) + x)))))) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (+ (* 2 (* x y)) (ite (<= x 0) 1 2)) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* 2 (* 2 (* (+ 1 (+ 2 2)) (+ (ite (<= x 0) 1 2) (+ (+ x x) x)))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
