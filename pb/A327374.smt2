;; sequence(s): A327374
;; terms: 52 53 54 55 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
;; small program: loop((((((1 + (2 * (2 + (2 + 2)))) + (if ((x div 2) div 2) <= 0 then 0 else 2)) + x) * 2) - 1) - x, 2, x) - 2
;; fast program: ((((((((((1 + (2 + (2 + 2))) * (1 + x)) + (x div (2 + 2))) * 2) + x) div (1 + x)) * 2) * 2) - 1) + x) - (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (- (* (+ (+ (+ 1 (* 2 (+ 2 (+ 2 2)))) (ite (<= (div (div x 2) 2) 0) 0 2)) x) 2) 1) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (+ (- (* (* (div (+ (* (+ (* (+ 1 (+ 2 (+ 2 2))) (+ 1 x)) (div x (+ 2 2))) 2) x) (+ 1 x)) 2) 2) 1) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
