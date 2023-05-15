;; sequence(s): A304498
;; terms: 2 5 7 9 12 14 16 18 21 23 26 28 30 33 35 37 39 42 44 47
;; small program: loop(((((if ((x mod (1 + 2)) mod 2) <= 0 then x else 1) div 2) mod 2) + 1) + x, x, 2) + x
;; fast program: (((((if (((x mod (1 + (2 * (2 + 2)))) - 2) - 2) <= 0 then 2 else 1) + x) div (1 + 2)) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (div (ite (<= (mod (mod x (+ 1 2)) 2) 0) x 1) 2) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (ite (<= (- (- (mod x (+ 1 (* 2 (+ 2 2)))) 2) 2) 0) 2 1) x) (+ 1 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
