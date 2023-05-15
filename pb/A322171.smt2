;; sequence(s): A322171
;; terms: 3 11 17 19 23 31 37 39 43 51 57 59 63 71 77 79 83 91 97 99
;; small program: (2 * loop(((x - 2) mod (1 + (2 + 2))) + x, x, 1)) + 1
;; fast program: (((((1 + 2) * ((if (((1 + x) mod (2 + 2)) - 1) <= 0 then 1 else 2) + x)) div 2) + x) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (mod (- x 2) (+ 1 (+ 2 2))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (div (* (+ 1 2) (+ (ite (<= (- (mod (+ 1 x) (+ 2 2)) 1) 0) 1 2) x)) 2) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
