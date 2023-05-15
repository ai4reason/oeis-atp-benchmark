;; sequence(s): A199344
;; terms: 1 2 3 4 5 6 7 8 9 19 11 12 13 14 15 16 17 18 19 29
;; small program: (if ((1 + x) mod (2 + (2 * (2 + 2)))) <= 0 then (2 + (2 * (2 + 2))) else 1) + x
;; fast program: loop(2 * ((2 * (x + x)) + x), 1 - ((1 + x) mod (2 + (2 * (2 + 2)))), 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (mod (+ 1 x) (+ 2 (* 2 (+ 2 2)))) 0) (+ 2 (* 2 (+ 2 2))) 1) x))))
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ (* 2 (+ x x)) x)))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod (+ 1 x) (+ 2 (* 2 (+ 2 2))))))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
