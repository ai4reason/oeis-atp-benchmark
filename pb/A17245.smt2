;; sequence(s): A17245
;; terms: 7 16 25 34 43 52 61 70 79 88 97 106 115 124 133 142 151 160 169 178
;; small program: 2 + loop(((x + x) + x) + y, 2, x)
;; fast program: 1 + ((1 + 2) * (2 + ((x + x) + x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x x) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 2) (+ 2 (+ (+ x x) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
