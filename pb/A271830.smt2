;; sequence(s): A271830
;; terms: 3 2 1 4 5 6 9 8 7 10 11 12 15 14 13 16 17 18 21 20
;; small program: (1 + (2 - (2 * (x mod (1 + (2 - (x mod 2))))))) + x
;; fast program: loop((2 * (1 - (x mod (1 + 2)))) + x, 1 - (x mod 2), x) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (- 2 (* 2 (mod x (+ 1 (- 2 (mod x 2))))))) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (* 2 (- 1 (mod x (+ 1 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
