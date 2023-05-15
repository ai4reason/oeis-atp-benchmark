;; sequence(s): A331952
;; terms: ~1 0 2 6 11 18 26 36 47 60 74 90 107 126 146 168 191 216 242 270
;; small program: (x * x) - loop((y div 2) + x, x, 1)
;; fast program: ((x * x) - 1) - ((x * x) div (2 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* x x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (- (* x x) 1) (div (* x x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
