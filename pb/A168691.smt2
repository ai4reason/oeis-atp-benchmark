;; sequence(s): A168691-A168739-A168787-A168835-A168883-A168931-A168979-A169027-A169075-A169123-A169171-A169219-A169267-A169315-A169363-A169411-A169459-A169507-A169555-A170023-A170071-A170119-A170167-A170215-A170263-A170311-A170359-A170407-A170455-A170503-A170551-A170599-A170647-A170695
;; terms: 1 14 182 2366 30758 399854 5198102 67575326 878479238 11420230094 148462991222 1930018885886 25090245516518 326173191714734 4240251492291542 55123269399790046 716602502197270598
;; small program: loop2(((2 * (2 + (2 + 2))) + y) * x, 1, x, 1, 2)
;; fast program: if x <= 0 then 1 else (2 * loop2(x * y, y, x - 1, 1 + (2 + (2 + 2)), 1 + (2 * (2 + (2 + 2)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (* 2 (+ 2 (+ 2 2))) y) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (= i1 (+ 1 (+ 2 (+ 2 2)))))
(assert (= j1 (+ 1 (* 2 (+ 2 (+ 2 2))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= x 0) 1 (* 2 (w1 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)