;; sequence(s): A159941
;; terms: 8 32 92 212 416 728 1172 1772 2552 3536 4748 6212 7952 9992 12356 15068 18152 21632 25532 29876
;; small program: 2 * (2 * (2 + ((1 + 2) * loop((y * y) + x, x, x))))
;; fast program: 2 + (2 * ((1 + (x + x)) * (1 + (2 + ((x * x) + x)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (* 2 (+ 2 (* (+ 1 2) (v0 x))))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* 2 (* (+ 1 (+ x x)) (+ 1 (+ 2 (+ (* x x) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)