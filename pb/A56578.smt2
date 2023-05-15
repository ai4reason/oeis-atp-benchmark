;; sequence(s): A56578
;; terms: 1 10 49 142 313 586 985 1534 2257 3178 4321 5710 7369 9322 11593 14206 17185 20554 24337 28558
;; small program: loop(((2 + (y * y)) * y) - x, x + x, 1)
;; fast program: 1 + ((2 + ((2 * ((2 * (x * x)) + x)) + x)) * x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* (+ 2 (* y y)) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 2 (+ (* 2 (+ (* 2 (* x x)) x)) x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)