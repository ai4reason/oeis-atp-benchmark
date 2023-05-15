;; sequence(s): A174256
;; terms: 0 0 0 8 16 8 24 24 24 32 40 32 48 48 48 56 64 56 72 72
;; small program: 2 * (2 * (2 * ((x div 2) - ((x mod (1 + 2)) div 2))))
;; fast program: (loop(x - 2, (x mod (1 + 2)) - 1, x) - (x mod 2)) * (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* 2 (* 2 (* 2 (- (div x 2) (div (mod x (+ 1 2)) 2))))))))
(assert (forall ((x Int)) (= (f0 x) (- x 2))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (- (v0 x) (mod x 2)) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)