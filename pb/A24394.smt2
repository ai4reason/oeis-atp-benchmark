;; sequence(s): A24394
;; terms: 4 29 93 214 410 699 1099 1628 2304 3145 4169 5394 6838 8519 10455 12664 15164 17973 21109 24590
;; small program: loop2((y * y) + x, 1 + (2 + y), 1 + x, 0, 2)
;; fast program: ((1 + x) * (2 + ((1 + 2) * ((1 + (x + x)) * (2 + x))))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 (+ 2 y)))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (= i0 0))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 x) (+ 2 (* (+ 1 2) (* (+ 1 (+ x x)) (+ 2 x))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
