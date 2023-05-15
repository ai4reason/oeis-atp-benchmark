;; sequence(s): A211622
;; terms: 0 3 26 94 229 457 800 1284 1931 2767 3814 5098 6641 8469 10604 13072 15895 19099 22706 26742
;; small program: ((loop(x * x, 2, x + x) div (1 + (x + x))) + x) div 2
;; fast program: ((1 + (((2 * (2 * (2 * (x * x)))) * x) + x)) * x) div (1 + (2 * x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (div (v0 x) (+ 1 (+ x x))) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (+ (* (* 2 (* 2 (* 2 (* x x)))) x) x)) x) (+ 1 (* 2 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
