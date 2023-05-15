;; sequence(s): A202141
;; terms: 5 2 25 74 149 250 377 530 709 914 1145 1402 1685 1994 2329 2690 3077 3490 3929 4394
;; small program: ((loop(1 - ((2 + y) * x), 2, x) + x) * (x - 1)) + 2
;; fast program: ((((1 + 2) * ((2 * (x + x)) - 1)) + x) * (x - 1)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- 1 (* (+ 2 y) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (v0 x) x) (- x 1)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* (+ 1 2) (- (* 2 (+ x x)) 1)) x) (- x 1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
