;; sequence(s): A281660
;; terms: 1 2 15 20 85 78 259 200 585 410 1111 732 1885 1190 2955 1808 4369 2610 6175 3620
;; small program: (1 + (x * x)) * (1 + (x div (1 + (x mod 2))))
;; fast program: (1 + (x * x)) * (1 + loop(x div 2, x mod 2, x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 (* x x)) (+ 1 (div x (+ 1 (mod x 2))))))))
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* x x)) (+ 1 (v0 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)