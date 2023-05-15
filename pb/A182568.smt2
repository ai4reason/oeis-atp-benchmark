;; sequence(s): A182568
;; terms: 0 0 0 0 0 2 4 6 8 12 16 20 24 30 36 42 48 56 64 72
;; small program: (0 - (loop(x - (y div 2), x, x) div 2)) * 2
;; fast program: (((2 - x) * (2 - x)) div (2 * (2 + 2))) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (div y 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- 0 (div (v0 x) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (div (* (- 2 x) (- 2 x)) (* 2 (+ 2 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
