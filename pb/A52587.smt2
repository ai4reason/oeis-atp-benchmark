;; sequence(s): A52587
;; terms: 0 0 2 6 48 480 5760 80640 1290240 23224320 464486400 10218700800 245248819200 6376469299200 178541140377600 5356234211328000 171399494762496000 5827582821924864000 209792981589295104000
;; small program: (loop(((if (x - y) <= 0 then 0 else x) + x) * y, x, 1) div 2) * 2
;; fast program: loop2(x * y, 2 + y, (x - 2) - 1, 1, 2 + 2) * ((x * x) - x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (ite (<= (- x y) 0) 0 x) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (div (v0 x) 2) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (h1 x) (- (- x 2) 1))))
(assert (= i1 1))
(assert (= j1 (+ 2 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (* (w1 x) (- (* x x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)