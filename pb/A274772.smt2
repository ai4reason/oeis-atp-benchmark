;; sequence(s): A274772
;; terms: 0 1 6 24 66 149 292 520 860 1345 2010 2896 4046 5509 7336 9584 12312 15585 19470 24040
;; small program: (1 + (loop(loop(((y * y) + x) - y, y + y, x), x, x) div 2)) div 2
;; fast program: (1 + (((1 + (2 * (x * x))) * ((2 + x) * x)) div (2 + (2 + 2)))) div 2
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (+ (* y y) x) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ y y))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ 1 (div (v0 x) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ 1 (div (* (+ 1 (* 2 (* x x))) (* (+ 2 x) x)) (+ 2 (+ 2 2)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
