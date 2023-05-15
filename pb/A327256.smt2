;; sequence(s): A327256
;; terms: 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1
;; small program: loop(2 + (((y * y) div (x + y)) + y), 2 * (x + x), 0) mod 2
;; fast program: ((((0 - x) div (((((2 + 2) * 2) * 2) * 2) + 2)) - x) div (1 + 2)) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) (+ x y)) y)))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (div (- (div (- 0 x) (+ (* (* (* (+ 2 2) 2) 2) 2) 2)) x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
