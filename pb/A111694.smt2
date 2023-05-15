;; sequence(s): A111694
;; terms: 0 8 26 57 104 170 258 371 512 684 890 1133 1416 1742 2114 2535 3008 3536 4122 4769
;; small program: (loop(x + y, 2 + x, x) * x) + x
;; fast program: ((((2 + (2 + x)) * (2 + x)) + x) div 2) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ (* (+ 2 (+ 2 x)) (+ 2 x)) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
