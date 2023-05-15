;; sequence(s): A2414
;; terms: 1 9 30 70 135 231 364 540 765 1045 1386 1794 2275 2835 3480 4216 5049 5985 7030 8190
;; small program: (1 + (x + x)) * (1 + loop(x + y, x, x))
;; fast program: (1 + (x + x)) * (((1 + x) * (2 + x)) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ x x)) (+ 1 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ x x)) (div (* (+ 1 x) (+ 2 x)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)