;; sequence(s): A38866
;; terms: 124 208 316 448 604 784 988 1216 1468 1744 2044 2368 2716 3088 3484 3904 4348 4816 5308 5824
;; small program: 2 * loop2(((y * y) + x) + x, x, 1 + 2, 1 + x, 2)
;; fast program: (1 + ((1 + 2) * (2 + ((2 + (2 + x)) * (2 + x))))) * (2 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int)) (= (i0 x) (+ 1 x))))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (* 2 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* (+ 1 2) (+ 2 (* (+ 2 (+ 2 x)) (+ 2 x))))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)