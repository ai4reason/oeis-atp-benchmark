;; sequence(s): A39823
;; terms: 1 2 4 6 8 11 15 19 23 28 34 40 46 53 61 69 77 86 96 106
;; small program: loop(x + y, 1 + x, 2) div 2
;; fast program: 1 + (x - ((x - (x * x)) div (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (- x (div (- x (* x x)) (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)