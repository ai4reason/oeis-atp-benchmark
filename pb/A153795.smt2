;; sequence(s): A153795
;; terms: 0 5 40 105 200 325 480 665 880 1125 1400 1705 2040 2405 2800 3225 3680 4165 4680 5225
;; small program: (loop(2 - (x + x), 2 + 2, x) - x) * x
;; fast program: (1 + (2 + 2)) * ((((x - 2) + x) + x) * x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 2 (+ x x)))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 2)) (* (+ (+ (- x 2) x) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)