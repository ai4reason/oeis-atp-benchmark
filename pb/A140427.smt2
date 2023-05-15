;; sequence(s): A140427
;; terms: 0 0 0 0 1 1 2 3 4 4 4 4 5 5 6 7 8 8 8 8
;; small program: loop(x - (((x + y) div (2 + 2)) mod 2), 2, x) div 2
;; fast program: ((if (((1 - x) mod (2 * (2 + 2))) - 2) <= 0 then 1 else 0) + (x div 2)) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (mod (div (+ x y) (+ 2 2)) 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (+ (ite (<= (- (mod (- 1 x) (* 2 (+ 2 2))) 2) 0) 1 0) (div x 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
