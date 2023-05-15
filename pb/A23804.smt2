;; sequence(s): A23804-A43095-A342851
;; terms: 0 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19 21
;; small program: loop((if x <= 0 then 1 else x) div (1 + 2), 2, x - 1) + x
;; fast program: (((if x <= 0 then 1 else x) - 1) div (1 + (2 * (2 + 2)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (ite (<= x 0) 1 x) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (* 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
