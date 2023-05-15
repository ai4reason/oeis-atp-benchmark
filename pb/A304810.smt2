;; sequence(s): A304810
;; terms: 1 3 4 5 6 7 8 9 11 12 13 14 15 16 18 19 20 21 22 24
;; small program: ((loop(1 + ((((x div (2 + (x mod 2))) + x) mod 2) + x), x, 1) + x) div 2) + 1
;; fast program: ((((((if ((x mod (1 + (2 * (2 + 2)))) - 1) <= 0 then 2 else 1) + x) div (1 + 2)) + 1) div 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (mod (+ (div x (+ 2 (mod x 2))) x) 2) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (+ (ite (<= (- (mod x (+ 1 (* 2 (+ 2 2)))) 1) 0) 2 1) x) (+ 1 2)) 1) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
