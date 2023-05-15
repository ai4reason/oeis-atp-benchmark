;; sequence(s): A96320
;; terms: 2 3 5 8 2 7 3 0 8 7 7 8 0 3 7 2 8 5 3 2
;; small program: loop(x + y, x, 2) mod (2 + (2 * (2 + 2)))
;; fast program: (2 + (((x * x) + x) div 2)) mod (2 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) (+ 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (mod (+ 2 (div (+ (* x x) x) 2)) (+ 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)