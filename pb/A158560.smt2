;; sequence(s): A158560
;; terms: 29 119 269 479 749 1079 1469 1919 2429 2999 3629 4319 5069 5879 6749 7679 8669 9719 10829 11999
;; small program: ((1 + x) * loop((2 + (2 + y)) * x, 2, 1 + x)) - 1
;; fast program: (2 * ((1 + 2) * ((1 + (2 + 2)) * (1 + ((2 + x) * x))))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 (+ 2 y)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 x) (v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 2) (* (+ 1 (+ 2 2)) (+ 1 (* (+ 2 x) x))))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
