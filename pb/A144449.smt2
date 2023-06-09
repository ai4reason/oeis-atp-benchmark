;; sequence(s): A144449
;; terms: 16 112 280 520 832 1216 1672 2200 2800 3472 4216 5032 5920 6880 7912 9016 10192 11440 12760 14152
;; small program: loop2(((x + y) + y) * (x - y), 2, 2, 2 + x, x)
;; fast program: 2 * (2 * (((2 * (2 + x)) + x) * (1 + ((x + x) + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (+ x y) y) (- x y)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* (+ (* 2 (+ 2 x)) x) (+ 1 (+ (+ x x) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
