;; sequence(s): A206905
;; terms: 9 18 27 36 45 55 64 73 82 91 101 110 119 128 137 147 156 165 174 183
;; small program: loop((x + x) + x, 2, 1 + x) + (x div (1 + (2 + 2)))
;; fast program: ((1 + 2) * ((1 + 2) * (1 + x))) + (x div (1 + (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (div x (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (* (+ 1 2) (+ 1 x))) (div x (+ 1 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
