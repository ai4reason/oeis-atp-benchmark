;; sequence(s): A144640
;; terms: 3 17 48 102 185 303 462 668 927 1245 1628 2082 2613 3227 3930 4728 5627 6633 7752 8990
;; small program: ((1 + (x + x)) * loop(x + y, 2 + x, 0)) - x
;; fast program: ((1 + (x + x)) * (((1 + (2 + x)) * (2 + x)) div 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (+ x x)) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ x x)) (div (* (+ 1 (+ 2 x)) (+ 2 x)) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
