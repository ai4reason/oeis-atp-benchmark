;; sequence(s): A57570
;; terms: 0 3 4 13 15 30 33 54 58 85 90 123 129 168 175 220 228 279 288 345
;; small program: loop(((if (y mod 2) <= 0 then 1 else (2 + (2 + 2))) * y) + x, x, 0) div 2
;; fast program: ((1 + ((((1 + 2) * (x - (x div 2))) + x) + x)) * ((1 + x) div 2)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (ite (<= (mod y 2) 0) 1 (+ 2 (+ 2 2))) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (+ (+ (* (+ 1 2) (- x (div x 2))) x) x)) (div (+ 1 x) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)