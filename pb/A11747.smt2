;; sequence(s): A11747
;; terms: 1 0 0 1 0 0 1 1 0 0 0 0 1 0 1 1 0 1 0 1
;; small program: loop2((((((1 + 2) mod (x * y)) + 2) + x) * x) div y, x, x, 1, 2) mod 2
;; fast program: (((((((x * x) * x) * x) * x) mod ((2 * (2 * (2 * (2 + 2)))) - 1)) - 2) mod (1 + (2 * (2 * (2 + 2))))) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* (+ (+ (mod (+ 1 2) (* x y)) 2) x) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (mod (w0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (mod (- (mod (* (* (* (* x x) x) x) x) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) 2) (+ 1 (* 2 (* 2 (+ 2 2))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)