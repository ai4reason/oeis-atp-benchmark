;; sequence(s): A44061
;; terms: 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 256 288 304 320 336
;; small program: (((((if x <= 0 then 1 else x) - 1) div ((2 * (2 * (2 + 2))) - 1)) + 1) + x) * loop(x * x, 2, 2)
;; fast program: (((((if x <= 0 then 1 else x) - 1) div ((2 * (2 * (2 + 2))) - 1)) + 1) + x) * (2 * (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (div (- (ite (<= x 0) 1 x) 1) (- (* 2 (* 2 (+ 2 2))) 1)) 1) x) v0))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (div (- (ite (<= x 0) 1 x) 1) (- (* 2 (* 2 (+ 2 2))) 1)) 1) x) (* 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
