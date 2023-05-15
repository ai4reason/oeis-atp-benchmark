;; sequence(s): A174029
;; terms: 3 18 21 45 39 72 57 99 75 126 93 153 111 180 129 207 147 234 165 261
;; small program: (((1 + ((x + x) + x)) * (2 + (x mod 2))) div 2) * (1 + 2)
;; fast program: loop((x div 2) + x, x mod 2, 1 + ((x + x) + x)) * (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (* (+ 1 (+ (+ x x) x)) (+ 2 (mod x 2))) 2) (+ 1 2)))))
(assert (forall ((x Int)) (= (f0 x) (+ (div x 2) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (+ (+ x x) x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)