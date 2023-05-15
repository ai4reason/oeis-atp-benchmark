;; sequence(s): A57538
;; terms: 1 11 19 29 31 41 49 59 61 71 79 89 91 101 109 119 121 131 139 149
;; small program: (loop((((y - 1) + y) * (x - (x div 2))) + x, 2, x) * 2) + 1
;; fast program: ((((((1 + 2) * (x - (x div (2 + 2)))) + x) * 2) + 1) + (x mod 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (- y 1) y) (- x (div x 2))) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (* (+ (* (+ 1 2) (- x (div x (+ 2 2)))) x) 2) 1) (mod x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
