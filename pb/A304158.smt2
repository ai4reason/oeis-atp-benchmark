;; sequence(s): A304158
;; terms: 24 84 144 204 264 324 384 444 504 564 624 684 744 804 864 924 984 1044 1104 1164
;; small program: loop(1 + ((2 + y) * x), 1 + 2, x) - 2
;; fast program: 2 * (2 * ((1 + 2) * (2 + ((2 * (x + x)) + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (+ 2 y) x)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* (+ 1 2) (+ 2 (+ (* 2 (+ x x)) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
