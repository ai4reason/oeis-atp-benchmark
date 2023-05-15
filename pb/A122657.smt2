;; sequence(s): A122657
;; terms: 0 0 8 54 256 750 1944 4116 8192 14580 25000 39930 62208 92274 134456 189000 262144 353736 472392 617310
;; small program: (loop((x div y) * x, 2, x) div 2) * x
;; fast program: ((((x * x) div (2 + 2)) * x) * x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (div x y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (* (* (* (div (* x x) (+ 2 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
