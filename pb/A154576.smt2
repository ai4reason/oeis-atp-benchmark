;; sequence(s): A154576
;; terms: 21 41 65 93 125 161 201 245 293 345 401 461 525 593 665 741 821 905 993 1085
;; small program: 1 + (2 * (2 * loop(1 + (x + y), 2 + x, x)))
;; fast program: 1 + (2 * (2 + ((1 + x) * ((2 * (2 + 2)) + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (* 2 (v0 x)))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (+ 2 (* (+ 1 x) (+ (* 2 (+ 2 2)) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
