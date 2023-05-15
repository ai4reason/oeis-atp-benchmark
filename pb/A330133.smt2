;; sequence(s): A330133
;; terms: 0 1 3 6 10 16 23 31 40 51 63 76 90 106 123 141 160 181 203 226
;; small program: (1 + loop((y div 2) + x, x, x * x)) div 2
;; fast program: (x * x) - (((1 + 2) * (x * x)) div ((2 + 2) * 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ 1 (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* x x) (div (* (+ 1 2) (* x x)) (* (+ 2 2) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)