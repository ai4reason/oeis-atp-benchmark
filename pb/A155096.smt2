;; sequence(s): A155096
;; terms: 12 17 41 46 70 75 99 104 128 133 157 162 186 191 215 220 244 249 273 278
;; small program: ((loop((((x + y) mod 2) + x) + x, 2 + 2, x) - x) + (x div 2)) - x
;; fast program: ((2 + (((1 + 2) * (x div 2)) + x)) * ((2 + 2) + 2)) + ((0 - x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (+ x y) 2) x) x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (+ (- (v0 x) x) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 2 (+ (* (+ 1 2) (div x 2)) x)) (+ (+ 2 2) 2)) (div (- 0 x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
