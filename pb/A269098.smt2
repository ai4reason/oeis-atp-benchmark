;; sequence(s): A269098
;; terms: 1 2 3 3 4 7 5 6 11 7 8 15 9 10 19 11 12 23 13 14
;; small program: (((if ((x mod (1 + 2)) - 1) <= 0 then (1 - x) else x) div (1 + 2)) + 1) + x
;; fast program: (loop(y, x mod (1 + 2), 1) * ((1 + (x + x)) div (1 + 2))) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (ite (<= (- (mod x (+ 1 2)) 1) 0) (- 1 x) x) (+ 1 2)) 1) x))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (* (v0 x) (div (+ 1 (+ x x)) (+ 1 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
