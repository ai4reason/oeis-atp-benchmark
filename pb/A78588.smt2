;; sequence(s): A78588-A82848
;; terms: 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
;; small program: loop(2 + (((y * y) div x) + y), x + x, 2) mod 2
;; fast program: (((((x div (2 + (2 * (2 * (2 + 2))))) - (if x <= 0 then 2 else x)) div (2 + 2)) + 1) + x) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (+ (div (- (div x (+ 2 (* 2 (* 2 (+ 2 2))))) (ite (<= x 0) 2 x)) (+ 2 2)) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
