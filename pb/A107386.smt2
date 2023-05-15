;; sequence(s): A107386
;; terms: 0 1 1 2 2 7 9 16 20 29 35 46 54 67 77 92 104 121 135 154
;; small program: (loop((y * y) - x, (x - 1) - 2, 1) + x) - (if (x - 1) <= 0 then 1 else 2)
;; fast program: (((((x * x) + x) mod (1 + ((2 + (x * x)) div (2 + 2)))) - 1) * (x div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) (- (- x 1) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (+ (v0 x) x) (ite (<= (- x 1) 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (- (mod (+ (* x x) x) (+ 1 (div (+ 2 (* x x)) (+ 2 2)))) 1) (div x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
