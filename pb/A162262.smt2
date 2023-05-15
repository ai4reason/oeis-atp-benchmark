;; sequence(s): A162262
;; terms: ~3 5 30 78 155 267 420 620 873 1185 1562 2010 2535 3143 3840 4632 5525 6525 7638 8870
;; small program: (((1 + (x + x)) * ((loop(x + y, x, x) + x) - 1)) + x) - 2
;; fast program: (((1 + (2 + (2 + x))) * (((1 + (x + x)) * x) - 2)) div 2) + 2
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
(assert (forall ((x Int)) (= (small x) (- (+ (* (+ 1 (+ x x)) (- (+ (v0 x) x) 1)) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 1 (+ 2 (+ 2 x))) (- (* (+ 1 (+ x x)) x) 2)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
