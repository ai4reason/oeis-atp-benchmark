;; sequence(s): A155097
;; terms: 6 31 43 68 80 105 117 142 154 179 191 216 228 253 265 290 302 327 339 364
;; small program: ((loop(1 + (2 * ((((x mod 2) + x) + x) + x)), 2, x) + x) div 2) + 2
;; fast program: (((((1 + (2 * (2 + (2 + 2)))) * ((x - (x div 2)) + x)) + 2) - x) + 2) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (+ (+ (+ (mod x 2) x) x) x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (+ (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (+ (- x (div x 2)) x)) 2) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
