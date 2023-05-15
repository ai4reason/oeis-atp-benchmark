;; sequence(s): A226293
;; terms: 6 5 4 3 2 1 13 12 11 10 9 8 20 19 18 17 16 15 27 26
;; small program: (((2 * (2 - (x mod (2 + (2 + 2))))) + x) + ((x div (1 + 2)) div 2)) + 2
;; fast program: (loop(1 + ((2 * (2 + (2 * ((x + x) + x)))) + x), 1, x div (2 + (2 + 2))) + 1) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (* 2 (- 2 (mod x (+ 2 (+ 2 2))))) x) (div (div x (+ 1 2)) 2)) 2))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (* 2 (+ 2 (* 2 (+ (+ x x) x)))) x)))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (div x (+ 2 (+ 2 2))))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ (v0 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
