;; sequence(s): A81345
;; terms: 1 4 5 16 17 36 37 64 65 100 101 144 145 196 197 256 257 324 325 400
;; small program: 1 + (((2 * (x mod 2)) + x) * x)
;; fast program: 1 + (loop(2 + x, x mod 2, x) * x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ (* 2 (mod x 2)) x) x)))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (v0 x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
