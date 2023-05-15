;; sequence(s): A5828
;; terms: 4 31 1921 7380481 108942999582721 23737154316161495960243527681 1126904990058528673830897031906808442930637286502826475521
;; small program: loop((2 * (x * x)) - 1, x, 2 + 2)
;; fast program: loop((x - 2) * x, x, 1 + (2 * (2 + 2))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* 2 (* x x)) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (- x 2) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
