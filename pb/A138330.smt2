;; sequence(s): A138330
;; terms: 1 2 1 1 1 1 2 1 2 1 1 2 1 2 1 1 1 1 2 1
;; small program: (loop(2 + (((y * y) div x) + (x div 2)), 2 + (x + x), 1) mod 2) + 1
;; fast program: if (((((1 + (2 + (2 + 2))) * (1 + (x + x))) + (x div (1 + (2 + (2 + 2))))) mod (2 + (2 * (2 + 2)))) - 2) <= 0 then 2 else 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) x) (div x 2))))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (mod (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (mod (+ (* (+ 1 (+ 2 (+ 2 2))) (+ 1 (+ x x))) (div x (+ 1 (+ 2 (+ 2 2))))) (+ 2 (* 2 (+ 2 2)))) 2) 0) 2 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
