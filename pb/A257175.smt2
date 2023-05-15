;; sequence(s): A257175
;; terms: 0 1 2 2 3 4 5 5 6 7 7 8 9 10 10 11 12 12 13 14
;; small program: loop(((y + y) div (x * x)) + x, (x * x) + x, 1) div 2
;; fast program: (((2 * ((1 + 2) * (1 + (x + x)))) div (1 + (2 * (2 * (2 + (2 * (2 + 2))))))) * (0 - 1)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ y y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (* x x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div (* 2 (* (+ 1 2) (+ 1 (+ x x)))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) (- 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
