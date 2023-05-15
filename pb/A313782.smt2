;; sequence(s): A313782
;; terms: 1 5 10 15 21 26 31 37 42 47 52 57 62 67 73 78 83 89 94 99
;; small program: (((loop(((2 + (2 * ((1 + x) div (2 + 2)))) div (1 + 2)) + y, x, 1) + x) + x) + x) + x
;; fast program: ((((((((((((((x + x) + x) div (2 + (2 * (2 + 2)))) * 2) + 1) + x) - (if x <= 0 then 0 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ 2 (* 2 (div (+ 1 x) (+ 2 2)))) (+ 1 2)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (v0 x) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (- (+ (+ (* (div (+ (+ x x) x) (+ 2 (* 2 (+ 2 2)))) 2) 1) x) (ite (<= x 0) 0 2)) x) x) (+ 1 2)) 1) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
