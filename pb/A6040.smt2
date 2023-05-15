;; sequence(s): A6040
;; terms: 1 2 9 82 1313 32826 1181737 57905114 3705927297 300180111058 30018011105801 3632179343801922 523033825507476769 88392716510763573962 17324972436109660496553 3898118798124673611724426 997918412319916444601453057 288398421160455852489819933474
;; small program: loop(1 + ((x * y) * y), x, 1)
;; fast program: ((x * x) * loop(1 + ((y * y) * x), x - 1, 1)) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (* x y) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* (* y y) x)))))
(assert (forall ((x Int)) (= (g1 x) (- x 1))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* x x) (v1 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
