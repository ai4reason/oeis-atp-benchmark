;; sequence(s): A311932
;; terms: 1 4 8 13 17 22 26 31 35 40 44 48 52 56 61 65 70 74 79 83
;; small program: (((loop(((((2 + ((if (x mod (1 + (2 + 2))) <= 0 then 1 else 2) + x)) mod (1 + 2)) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: ((((((((((((((((((((((((((2 * (x + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) - (if x <= 0 then 0 else 2)) + x) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (mod (+ 2 (+ (ite (<= (mod x (+ 1 (+ 2 2))) 0) 1 2) x)) (+ 1 2)) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (- (+ (+ (+ (+ (div (+ (+ (* (* (+ (+ (div (+ (+ (* (div (+ (+ (div (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x) x) (ite (<= x 0) 0 2)) x) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
