;; sequence(s): A158490
;; terms: 90 390 890 1590 2490 3590 4890 6390 8090 9990 12090 14390 16890 19590 22490 25590 28890 32390 36090 39990
;; small program: loop(2 * ((2 * (2 + (x + x))) + x), 2, (2 + x) * x) + 2
;; fast program: (2 * (2 * (loop(x * x, 1, (1 + (2 + 2)) * (1 + x)) - 2))) - 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ (* 2 (+ 2 (+ x x))) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (* (+ 2 x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (+ 1 (+ 2 2)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (- (v1 x) 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
