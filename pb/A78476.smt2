;; sequence(s): A78476
;; terms: 1 2 6 11 16 22 28 35 42 50 58 67 76 86 96 107 118 130 142 155
;; small program: loop(1 + (2 + ((y div 2) + x)), x - 1, 1) + x
;; fast program: (((((1 + ((2 + x) * x)) div (2 + 2)) + (if x <= 0 then 1 else x)) + x) - (if x <= 0 then 0 else 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ 2 (+ (div y 2) x))))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ (+ (div (+ 1 (* (+ 2 x) x)) (+ 2 2)) (ite (<= x 0) 1 x)) x) (ite (<= x 0) 0 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
