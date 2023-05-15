;; sequence(s): A59030
;; terms: 4 6 2 10 12 4 16 18 6 22 24 8 28 30 10 34 36 12 40 42
;; small program: (2 * (2 + x)) div (1 + (((2 + x) * x) mod (1 + 2)))
;; fast program: loop(x div (1 + 2), (x mod (1 + 2)) - 1, 2 + x) * 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (* 2 (+ 2 x)) (+ 1 (mod (* (+ 2 x) x) (+ 1 2)))))))
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
