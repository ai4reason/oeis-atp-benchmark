;; sequence(s): A269538
;; terms: 10 64 222 568 1210 2280 3934 6352 9738 14320 20350 28104 37882 50008 64830 82720 104074 129312 158878 193240
;; small program: 2 + (loop((x * x) - 1, 2, 2 + x) - (x * x))
;; fast program: (1 + x) * (2 + ((1 + x) * ((2 + x) * ((2 + 2) + x))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* x x) 1))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (- (v0 x) (* x x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 x) (+ 2 (* (+ 1 x) (* (+ 2 x) (+ (+ 2 2) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
