;; sequence(s): A130885
;; terms: 1 17 65 163 329 581 937 1415 2033 2809 3761 4907 6265 7853 9689 11791 14177 16865 19873 23219
;; small program: loop2((x + y) * (x * x), y + y, 2, 1, x) + x
;; fast program: 1 + ((2 + ((1 + x) * ((2 * (2 + x)) + x))) * x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ x y) (* x x)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ y y))))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (w0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 2 (* (+ 1 x) (+ (* 2 (+ 2 x)) x))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
