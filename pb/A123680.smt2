;; sequence(s): A123680
;; terms: 1 2 9 76 985 17046 366289 9374968 278095761 9375293170 353906211241 14785127222724 677150215857193 33734100501544366 1816008001717251105 105048613959883117936 6497985798745934394529 427999600108502895779658
;; small program: loop2(1 + ((x * y) - x), y - 1, x, 1, x + x)
;; fast program: ((loop2(1 + (x * y), y - 1, x - 1, 0, x + x) * x) + 1) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- (* x y) x)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- y 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- y 1))))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (= i1 0))
(assert (forall ((x Int)) (= (j1 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (w1 x) x) 1) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
