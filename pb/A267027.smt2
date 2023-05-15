;; sequence(s): A267027
;; terms: 1 4 5 7 9 10 13 16 17 19 21 22 25 28 29 31 33 34 37 40
;; small program: (((1 + x) mod (2 + (x mod 2))) + x) + x
;; fast program: loop(((x mod (1 + 2)) - 1) + x, x mod 2, 1 + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (mod (+ 1 x) (+ 2 (mod x 2))) x) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (- (mod x (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
