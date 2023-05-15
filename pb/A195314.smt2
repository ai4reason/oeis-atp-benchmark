;; sequence(s): A195314
;; terms: 1 29 85 169 281 421 589 785 1009 1261 1541 1849 2185 2549 2941 3361 3809 4285 4789 5321
;; small program: 1 + ((1 + x) * ((loop(x * x, 2, 2) - 2) * x))
;; fast program: 1 + (2 * ((1 + (2 + (2 + 2))) * ((x * x) + x)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ 1 x) (* (- v0 2) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (* (+ 1 (+ 2 (+ 2 2))) (+ (* x x) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)