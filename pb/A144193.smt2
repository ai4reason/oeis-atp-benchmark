;; sequence(s): A144193
;; terms: 0 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0
;; small program: ((x mod (1 + ((1 + 2) * (2 - (x mod 2))))) div 2) div 2
;; fast program: loop((if (((x mod (1 + (2 + (2 + 2)))) - 1) - 2) <= 0 then 0 else 1) + x, (1 + x) mod 2, x) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (div (mod x (+ 1 (* (+ 1 2) (- 2 (mod x 2))))) 2) 2))))
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (- (- (mod x (+ 1 (+ 2 (+ 2 2)))) 1) 2) 0) 0 1) x))))
(assert (forall ((x Int)) (= (g0 x) (mod (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
