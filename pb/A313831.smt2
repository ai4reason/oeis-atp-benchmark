;; sequence(s): A313831
;; terms: 1 5 10 16 20 25 31 36 40 46 51 56 61 66 72 76 81 87 92 96
;; small program: ((((((((((((((((((((((((((((2 * (x + x)) div loop(1 + (x + x), 2, 2)) + x) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x
;; fast program: ((((((((((((((((((((((((((((2 * (x + x)) div (1 + (2 + (2 * (2 + 2))))) + x) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (+ (- (+ (+ (+ (+ (div (+ (+ (* (* (+ (+ (div (+ (+ (* (+ (+ (div (+ (+ (+ (div (* 2 (+ x x)) v0) x) 1) x) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (- (+ (+ (+ (+ (div (+ (+ (* (* (+ (+ (div (+ (+ (* (+ (+ (div (+ (+ (+ (div (* 2 (+ x x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 1) x) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
