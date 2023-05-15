;; sequence(s): A191153
;; terms: 0 0 0 1 1 1 1 0 0 0 1 1 1 1 0 0 0 1 1 1
;; small program: (((loop((1 + (((x div 2) div 2) + x)) div (2 + y), 2, x) + 1) + x) div (2 + 2)) mod 2
;; fast program: (((1 + 2) * ((1 + (2 + 2)) * (1 + x))) div (1 + (2 * (2 + (2 * (2 * (2 + (2 + 2)))))))) mod 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ 1 (+ (div (div x 2) 2) x)) (+ 2 y)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (div (+ (+ (v0 x) 1) x) (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (div (* (+ 1 2) (* (+ 1 (+ 2 2)) (+ 1 x))) (+ 1 (* 2 (+ 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
