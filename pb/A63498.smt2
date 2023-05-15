;; sequence(s): A63498
;; terms: 0 32 104 236 448 760 1192 1764 2496 3408 4520 5852 7424 9256 11368 13780 16512 19584 23016 26828
;; small program: (((1 + (2 + 2)) * loop(((y * y) + x) + y, x, x)) + x) * 2
;; fast program: ((((((1 + x) * ((2 + x) * x)) div (1 + 2)) + x) * (1 + (2 + 2))) + x) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (* (+ 1 (+ 2 2)) (v0 x)) x) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (+ (div (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) x) (+ 1 (+ 2 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
