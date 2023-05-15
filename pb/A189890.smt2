;; sequence(s): A189890
;; terms: 2 4 10 23 46 82 134 205 298 416 562 739 950 1198 1486 1817 2194 2620 3098 3631
;; small program: 2 + (loop(x + y, x, 1) * x)
;; fast program: 1 + (((1 + x) * (2 + (x * x))) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (* (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (* (+ 1 x) (+ 2 (* x x))) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)