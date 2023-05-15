;; sequence(s): A180221
;; terms: 2 3 5 7 8 9 10 12 13 14 15 16 17 18 19 20 21 22 23 24
;; small program: loop(((x + y) div ((y div 2) + 2)) + y, x, 0) + 2
;; fast program: (((2 * ((x - (if x <= 0 then 0 else 2)) + x)) div (1 + x)) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ x y) (+ (div y 2) 2)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* 2 (+ (- x (ite (<= x 0) 0 2)) x)) (+ 1 x)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
