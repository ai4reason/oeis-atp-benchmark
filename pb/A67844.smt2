;; sequence(s): A67844
;; terms: 14 16 34 36 54 56 74 76 94 96 114 116 134 136 154 156 174 176 194 196
;; small program: (loop(1 + (x + x), 1 + 2, x div 2) + x) * 2
;; fast program: (2 * ((2 * (2 * (2 + (x - (x mod 2))))) + x)) - 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (+ (* 2 (* 2 (+ 2 (- x (mod x 2))))) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
