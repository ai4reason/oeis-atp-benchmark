;; sequence(s): A158634
;; terms: 45 183 413 735 1149 1655 2253 2943 3725 4599 5565 6623 7773 9015 10349 11775 13293 14903 16605 18399
;; small program: ((1 + ((2 + x) * x)) * (loop((x + y) * x, 2, 2) - 2)) - 1
;; fast program: (2 * ((1 + ((2 + x) * x)) * ((2 * (2 * (2 + (2 + 2)))) - 1))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ x y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (* (+ 2 x) x)) (- v0 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 (* (+ 2 x) x)) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
